use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use framework "IOKit"
use scripting additions

-- Define the properties for easier referencing
property this : a reference to current application

-- Disable warnings before so many hours have passed since the last warning message
property disableWarningBeforeSoManyHoursHavePassed : 6

-- Define the threshold for battery warnings
property threshold : 20

-- Path to the file where the dictionary will be saved in the user's ~/Library/Preferences/
property storageFilePath : POSIX path of (path to library folder from user domain) & "Preferences/com.alberti42.magic-warnings.plist"

-- Dictionary to store the last notification time for each device by serial number
global lastNotificationTimes

on run
	-- Load the last notification times from the file (if it exists)
	my loadNotificationTimes()

	-- Get the list of all devices under AppleDeviceManagementHIDEventService
	set ioregCmd to "/usr/sbin/ioreg -c AppleDeviceManagementHIDEventService -r -l"
	set ioreg_output to do shell script ioregCmd

	-- Split the output into lines
	set outputLines to paragraphs of ioreg_output

	-- Initialize variables for processing each device
	set product_name to ""
	set serial_number to ""
	set battery_percent to ""
	set transport to ""

	repeat with |line| in outputLines

		-- Extract the transport method
		if |line| contains "\"Transport\"" then
			set transport to my extractField(|line|, "Transport")
		end if

		-- Only check the status for bluetooth devices; we do not need to check the battery for the Magic devices when charging on a USB connection
		if transport is "Bluetooth" then

			-- Extract the product name
			if |line| contains "\"Product\"" then
				set product_name to my extractField(|line|, "Product")
			end if

			-- Extract the serial number
			if |line| contains "\"SerialNumber\"" then
				set serial_number to my extractField(|line|, "SerialNumber")
			end if

			-- Extract the battery percentage
			if |line| contains "\"BatteryPercent\"" then
				set battery_percent to my extractField(|line|, "BatteryPercent")
				set battery_percent to my removeNonDigitCharacters(battery_percent)

				-- If the battery percentage is below the threshold, check if 3 hours have passed since the last notification
				if (battery_percent as integer) ≤ threshold then
					if (lastNotificationTimes's objectForKey:serial_number) is missing value then
						-- notification was recently emitted
						set notificationMessage to "Battery status: " & battery_percent & "%"
						set notificationTitle to product_name & " battery low"
						my showNotification(notificationMessage, notificationTitle)
						my updateLastNotificationTime(serial_number)
					end if
				end if
			end if

		end if
	end repeat

	-- Save the updated notification times to the file
	my saveNotificationTimes()
end run

-- Helper method to extract a field value from a line of text
on extractField(|line|, fieldName)
	set prefix to "\"" & fieldName & "\" = "
	set fieldValue to text ((offset of prefix in |line|) + (length of prefix)) thru -1 of |line|
	set fieldValue to my removeQuotes(fieldValue)
	return fieldValue
end extractField

-- Helper method to remove non-digit characters
on removeNonDigitCharacters(inputString)
	set NSString to (this's NSString's stringWithString:inputString)
	set digitsOnly to (NSString's stringByReplacingOccurrencesOfString:"[^0-9]" withString:"" options:(this's NSRegularExpressionSearch) range:{0, NSString's |length|()})
	return digitsOnly as text
end removeNonDigitCharacters

-- Helper method to remove quotes from a string
on removeQuotes(inputString)
	set NSString to (this's NSString's stringWithString:inputString)
	set resultString to (NSString's stringByReplacingOccurrencesOfString:"\"" withString:"")
	return resultString as text
end removeQuotes

-- Helper method to update the last notification time
on updateLastNotificationTime(serial_number)
	set currentDate to current date

	-- Set the current date as the value for the serial number key
	lastNotificationTimes's setObject:currentDate forKey:serial_number
end updateLastNotificationTime

-- Save notification times to a file using NSPropertyListSerialization
on saveNotificationTimes()
	set plistData to current application's NSPropertyListSerialization's dataWithPropertyList:lastNotificationTimes format:(current application's NSPropertyListXMLFormat_v1_0) options:0 |error|:(missing value)
	set plistData to plistData's writeToFile:storageFilePath atomically:true
end saveNotificationTimes

-- Load notification times from the file using NSPropertyListSerialization
on loadNotificationTimes()
	set fileManager to current application's NSFileManager's defaultManager()
	if (fileManager's fileExistsAtPath:storageFilePath) then
		set plistData to current application's NSData's dataWithContentsOfFile:storageFilePath
		set {loadedNotificationTimes, theError} to current application's NSPropertyListSerialization's propertyListWithData:plistData options:0 format:(missing value) |error|:(reference)
		if loadedNotificationTimes is not missing value then
			set lastNotificationTimes to loadedNotificationTimes's mutableCopy()

			-- Clean the last records in case they have already expired
			set currentDate to current date
			repeat with serial_number in ((lastNotificationTimes's allKeys()) as list)
				set notificationTime to (lastNotificationTimes's objectForKey:serial_number)
				if notificationTime is not missing value then
					if (currentDate - notificationTime) > (disableWarningBeforeSoManyHoursHavePassed * hours) then
						-- More than X hours have passed, the last notification time has expired, and we can drop it
						(lastNotificationTimes's removeObjectForKey:serial_number)
					end if
				end if
			end repeat
		else
			set lastNotificationTimes to current application's NSMutableDictionary's dictionary()
		end if
	else
		set lastNotificationTimes to current application's NSMutableDictionary's dictionary()
	end if
end loadNotificationTimes

-- Native AppleScript method to display a notification
on showNotification(message, title)
	display notification message with title title
end showNotification
