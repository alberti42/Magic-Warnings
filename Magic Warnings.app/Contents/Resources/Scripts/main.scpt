FasdUAS 1.101.10   ��   ��    k             l        	  x     �� 
 ��   
 1      ��
�� 
ascr  �� ��
�� 
minv  m         �    2 . 4��       Yosemite (10.10) or later    	 �   4   Y o s e m i t e   ( 1 0 . 1 0 )   o r   l a t e r      x    �� ����    4   	 �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    !�� ����    4    �� 
�� 
frmk  m       �   
 I O K i t��        x   ! -�� ����    2  # &��
�� 
osax��         l     ��������  ��  ��      ! " ! l     �� # $��   # 3 - Define the properties for easier referencing    $ � % % Z   D e f i n e   t h e   p r o p e r t i e s   f o r   e a s i e r   r e f e r e n c i n g "  & ' & j   - 0�� (�� 0 this   ( N   - / ) ) m   - .��
�� misccura '  * + * l     ��������  ��  ��   +  , - , l     �� . /��   . W Q Disable warnings before so many hours have passed since the last warning message    / � 0 0 �   D i s a b l e   w a r n i n g s   b e f o r e   s o   m a n y   h o u r s   h a v e   p a s s e d   s i n c e   t h e   l a s t   w a r n i n g   m e s s a g e -  1 2 1 j   1 3�� 3�� V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed 3 m   1 2����  2  4 5 4 l     ��������  ��  ��   5  6 7 6 l     �� 8 9��   8 0 * Define the threshold for battery warnings    9 � : : T   D e f i n e   t h e   t h r e s h o l d   f o r   b a t t e r y   w a r n i n g s 7  ; < ; j   4 6�� =�� 0 	threshold   = m   4 5����  <  > ? > l     ��������  ��  ��   ?  @ A @ l     �� B C��   B _ Y Path to the file where the dictionary will be saved in the user's ~/Library/Preferences/    C � D D �   P a t h   t o   t h e   f i l e   w h e r e   t h e   d i c t i o n a r y   w i l l   b e   s a v e d   i n   t h e   u s e r ' s   ~ / L i b r a r y / P r e f e r e n c e s / A  E F E j   7 G�� G�� "0 storagefilepath storageFilePath G b   7 F H I H n   7 B J K J 1   > B��
�� 
psxp K l  7 > L���� L I  7 >�� M N
�� .earsffdralis        afdr M m   7 8��
�� afdrdlib N �� O��
�� 
from O m   9 :��
�� fldmfldu��  ��  ��   I m   B E P P � Q Q \ P r e f e r e n c e s / o r g . a l b e r t i 4 2 . m a g i c - w a r n i n g s . p l i s t F  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V V P Dictionary to store the last notification time for each device by serial number    W � X X �   D i c t i o n a r y   t o   s t o r e   t h e   l a s t   n o t i f i c a t i o n   t i m e   f o r   e a c h   d e v i c e   b y   s e r i a l   n u m b e r U  Y Z Y p   H H [ [ ������ .0 lastnotificationtimes lastNotificationTimes��   Z  \ ] \ l     ��������  ��  ��   ]  ^ _ ^ i   H K ` a ` I     ������
�� .aevtoappnull  �   � ****��  ��   a k     � b b  c d c l     �� e f��   e D > Load the last notification times from the file (if it exists)    f � g g |   L o a d   t h e   l a s t   n o t i f i c a t i o n   t i m e s   f r o m   t h e   f i l e   ( i f   i t   e x i s t s ) d  h i h n     j k j I    �������� .0 loadnotificationtimes loadNotificationTimes��  ��   k  f      i  l m l l   ��������  ��  ��   m  n o n l   �� p q��   p M G Get the list of all devices under AppleDeviceManagementHIDEventService    q � r r �   G e t   t h e   l i s t   o f   a l l   d e v i c e s   u n d e r   A p p l e D e v i c e M a n a g e m e n t H I D E v e n t S e r v i c e o  s t s r    	 u v u m     w w � x x z / u s r / s b i n / i o r e g   - c   A p p l e D e v i c e M a n a g e m e n t H I D E v e n t S e r v i c e   - r   - l v o      ���� 0 ioregcmd ioregCmd t  y z y r   
  { | { I  
 �� }��
�� .sysoexecTEXT���     TEXT } o   
 ���� 0 ioregcmd ioregCmd��   | o      ���� 0 ioreg_output   z  ~  ~ l   ��������  ��  ��     � � � l   �� � ���   � "  Split the output into lines    � � � � 8   S p l i t   t h e   o u t p u t   i n t o   l i n e s �  � � � r     � � � n     � � � 2   ��
�� 
cpar � o    ���� 0 ioreg_output   � o      ���� 0 outputlines outputLines �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � 6 0 Initialize variables for processing each device    � � � � `   I n i t i a l i z e   v a r i a b l e s   f o r   p r o c e s s i n g   e a c h   d e v i c e �  � � � r     � � � m     � � � � �   � o      ���� 0 product_name   �  � � � r     � � � m     � � � � �   � o      ���� 0 serial_number   �  � � � r     # � � � m     ! � � � � �   � o      ���� 0 battery_percent   �  � � � l  $ $��������  ��  ��   �  � � � X   $ � ��� � � k   4 � � �  � � � l  4 4�� � ���   �   Extract the product name    � � � � 2   E x t r a c t   t h e   p r o d u c t   n a m e �  � � � Z   4 K � ����� � E   4 9 � � � o   4 5���� 0 line   � m   5 8 � � � � �  " P r o d u c t " � r   < G � � � n  < E � � � I   = E�� ����� 0 extractfield extractField �  � � � o   = >���� 0 line   �  ��� � m   > A � � � � �  P r o d u c t��  ��   �  f   < = � o      ���� 0 product_name  ��  ��   �  � � � l  L L��������  ��  ��   �  � � � l  L L�� � ���   �    Extract the serial number    � � � � 4   E x t r a c t   t h e   s e r i a l   n u m b e r �  � � � Z   L c � ����� � E   L Q � � � o   L M���� 0 line   � m   M P � � � � �  " S e r i a l N u m b e r " � r   T _ � � � n  T ] � � � I   U ]�� ����� 0 extractfield extractField �  � � � o   U V���� 0 line   �  ��� � m   V Y � � � � �  S e r i a l N u m b e r��  ��   �  f   T U � o      ���� 0 serial_number  ��  ��   �  � � � l  d d��������  ��  ��   �  � � � l  d d�� � ���   � %  Extract the battery percentage    � � � � >   E x t r a c t   t h e   b a t t e r y   p e r c e n t a g e �  ��� � Z   d � � ����� � E   d i � � � o   d e���� 0 line   � m   e h � � � � �   " B a t t e r y P e r c e n t " � k   l � � �  � � � r   l w � � � n  l u � � � I   m u�� ����� 0 extractfield extractField �  � � � o   m n���� 0 line   �  ��� � m   n q � � � � �  B a t t e r y P e r c e n t��  ��   �  f   l m � o      ���� 0 battery_percent   �  � � � r   x � � � � n  x ~ � � � I   y ~�� ����� 40 removenondigitcharacters removeNonDigitCharacters �  ��� � o   y z���� 0 battery_percent  ��  ��   �  f   x y � o      ���� 0 battery_percent   �  � � � l  � �����~��  �  �~   �    l  � ��}�}   q k If the battery percentage is below the threshold, check if 3 hours have passed since the last notification    � �   I f   t h e   b a t t e r y   p e r c e n t a g e   i s   b e l o w   t h e   t h r e s h o l d ,   c h e c k   i f   3   h o u r s   h a v e   p a s s e d   s i n c e   t h e   l a s t   n o t i f i c a t i o n �| Z   � ��{�z A   � �	 l  � �
�y�x
 c   � � o   � ��w�w 0 battery_percent   m   � ��v
�v 
long�y  �x  	 o   � ��u�u 0 	threshold   k   � �  r   � � b   � � b   � � m   � � �   B a t t e r y   s t a t u s :   o   � ��t�t 0 battery_percent   m   � � �  % o      �s�s *0 notificationmessage notificationMessage  r   � � b   � � o   � ��r�r 0 product_name   m   � �   �!!    b a t t e r y   l o w o      �q�q &0 notificationtitle notificationTitle "#" n  � �$%$ I   � ��p&�o�p $0 shownotification showNotification& '(' o   � ��n�n *0 notificationmessage notificationMessage( )�m) o   � ��l�l &0 notificationtitle notificationTitle�m  �o  %  f   � �# *�k* n  � �+,+ I   � ��j-�i�j 80 updatelastnotificationtime updateLastNotificationTime- .�h. o   � ��g�g 0 serial_number  �h  �i  ,  f   � ��k  �{  �z  �|  ��  ��  ��  �� 0 line   � o   ' (�f�f 0 outputlines outputLines � /0/ l  � ��e�d�c�e  �d  �c  0 121 l  � ��b34�b  3 6 0 Save the updated notification times to the file   4 �55 `   S a v e   t h e   u p d a t e d   n o t i f i c a t i o n   t i m e s   t o   t h e   f i l e2 6�a6 n  � �787 I   � ��`�_�^�` .0 savenotificationtimes saveNotificationTimes�_  �^  8  f   � ��a   _ 9:9 l     �]�\�[�]  �\  �[  : ;<; l     �Z=>�Z  = A ; Helper method to extract a field value from a line of text   > �?? v   H e l p e r   m e t h o d   t o   e x t r a c t   a   f i e l d   v a l u e   f r o m   a   l i n e   o f   t e x t< @A@ i   L OBCB I      �YD�X�Y 0 extractfield extractFieldD EFE o      �W�W 0 line  F G�VG o      �U�U 0 	fieldname 	fieldName�V  �X  C k     2HH IJI r     KLK b     MNM b     OPO m     QQ �RR  "P o    �T�T 0 	fieldname 	fieldNameN m    SS �TT  "   =  L o      �S�S 
0 prefix  J UVU r    &WXW n    $YZY 7  	 $�R[\
�R 
ctxt[ l    ]�Q�P] [     ^_^ l   `�O�N` I   a�Mba z�L�K
�L .sysooffslong    ��� null
�K misccura�M  b �Jcd
�J 
psofc o    �I�I 
0 prefix  d �He�G
�H 
psine o    �F�F 0 line  �G  �O  �N  _ l   f�E�Df n    ghg 1    �C
�C 
lengh o    �B�B 
0 prefix  �E  �D  �Q  �P  \ m   ! #�A�A��Z o    	�@�@ 0 line  X o      �?�? 0 
fieldvalue 
fieldValueV iji r   ' /klk n  ' -mnm I   ( -�>o�=�> 0 removequotes removeQuoteso p�<p o   ( )�;�; 0 
fieldvalue 
fieldValue�<  �=  n  f   ' (l o      �:�: 0 
fieldvalue 
fieldValuej q�9q L   0 2rr o   0 1�8�8 0 
fieldvalue 
fieldValue�9  A sts l     �7�6�5�7  �6  �5  t uvu l     �4wx�4  w 3 - Helper method to remove non-digit characters   x �yy Z   H e l p e r   m e t h o d   t o   r e m o v e   n o n - d i g i t   c h a r a c t e r sv z{z i   P S|}| I      �3~�2�3 40 removenondigitcharacters removeNonDigitCharacters~ �1 o      �0�0 0 inputstring inputString�1  �2  } k     ,�� ��� r     ��� l    ��/�.� n    ��� I    �-��,�- &0 stringwithstring_ stringWithString_� ��+� o    �*�* 0 inputstring inputString�+  �,  � n    ��� o    �)�) 0 nsstring NSString� o     �(�( 0 this  �/  �.  � o      �'�' 0 nsstring NSString� ��� r    '��� l   %��&�%� n   %��� I    %�$��#�$ �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m    �� ���  [ ^ 0 - 9 ]� ��� m    �� ���  � ��� l   ��"�!� n   ��� o    � �  60 nsregularexpressionsearch NSRegularExpressionSearch� o    �� 0 this  �"  �!  � ��� J    !�� ��� m    ��  � ��� n   ��� I    ���� 
0 length  �  �  � o    �� 0 nsstring NSString�  �  �#  � o    �� 0 nsstring NSString�&  �%  � o      �� 0 
digitsonly 
digitsOnly� ��� L   ( ,�� c   ( +��� o   ( )�� 0 
digitsonly 
digitsOnly� m   ) *�
� 
ctxt�  { ��� l     ����  �  �  � ��� l     ����  � 3 - Helper method to remove quotes from a string   � ��� Z   H e l p e r   m e t h o d   t o   r e m o v e   q u o t e s   f r o m   a   s t r i n g� ��� i   T W��� I      ���� 0 removequotes removeQuotes� ��� o      �� 0 inputstring inputString�  �  � k     �� ��� r     ��� l    ��
�	� n    ��� I    ���� &0 stringwithstring_ stringWithString_� ��� o    �� 0 inputstring inputString�  �  � n    ��� o    �� 0 nsstring NSString� o     �� 0 this  �
  �	  � o      �� 0 nsstring NSString� ��� r    ��� l   ��� � n   ��� I    ������� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_� ��� m    �� ���  "� ���� m    �� ���  ��  ��  � o    ���� 0 nsstring NSString�  �   � o      ���� 0 resultstring resultString� ���� L    �� c    ��� o    ���� 0 resultstring resultString� m    ��
�� 
ctxt��  � ��� l     ��������  ��  ��  � ��� l     ������  � 9 3 Helper method to update the last notification time   � ��� f   H e l p e r   m e t h o d   t o   u p d a t e   t h e   l a s t   n o t i f i c a t i o n   t i m e� ��� i   X [��� I      ������� 80 updatelastnotificationtime updateLastNotificationTime� ���� o      ���� 0 serial_number  ��  ��  � k     �� ��� r     ��� I    ������
�� .misccurdldt    ��� null��  ��  � o      ���� 0 currentdate currentDate� ��� l   ��������  ��  ��  � ��� l   ������  � B < Set the current date as the value for the serial number key   � ��� x   S e t   t h e   c u r r e n t   d a t e   a s   t h e   v a l u e   f o r   t h e   s e r i a l   n u m b e r   k e y� ���� n   ��� I   	 ������� &0 setobject_forkey_ setObject_forKey_� ��� o   	 
���� 0 currentdate currentDate� ���� o   
 ���� 0 serial_number  ��  ��  � o    	���� .0 lastnotificationtimes lastNotificationTimes��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D Save notification times to a file using NSPropertyListSerialization   � ��� �   S a v e   n o t i f i c a t i o n   t i m e s   t o   a   f i l e   u s i n g   N S P r o p e r t y L i s t S e r i a l i z a t i o n� � � i   \ _ I      �������� .0 savenotificationtimes saveNotificationTimes��  ��   k       r      n    	 I    ��
���� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_
  o    ���� .0 lastnotificationtimes lastNotificationTimes  l   ���� n    o    ���� <0 nspropertylistxmlformat_v1_0 NSPropertyListXMLFormat_v1_0 m    ��
�� misccura��  ��    m    ����   �� l   	���� m    	��
�� 
msng��  ��  ��  ��  	 n     o    ���� :0 nspropertylistserialization NSPropertyListSerialization m     ��
�� misccura o      ���� 0 	plistdata 	plistData �� r     n    I    ������ 20 writetofile_atomically_ writeToFile_atomically_  o    ���� "0 storagefilepath storageFilePath  ��  m    ��
�� boovtrue��  ��   o    ���� 0 	plistdata 	plistData o      ���� 0 	plistdata 	plistData��    !"! l     ��������  ��  ��  " #$# l     ��%&��  % N H Load notification times from the file using NSPropertyListSerialization   & �'' �   L o a d   n o t i f i c a t i o n   t i m e s   f r o m   t h e   f i l e   u s i n g   N S P r o p e r t y L i s t S e r i a l i z a t i o n$ ()( i   ` c*+* I      �������� .0 loadnotificationtimes loadNotificationTimes��  ��  + k     �,, -.- r     	/0/ n    121 I    ��������  0 defaultmanager defaultManager��  ��  2 n    343 o    ���� 0 nsfilemanager NSFileManager4 m     ��
�� misccura0 o      ���� 0 filemanager fileManager. 5��5 Z   
 �67��86 l  
 9����9 n  
 :;: I    ��<���� &0 fileexistsatpath_ fileExistsAtPath_< =��= o    ���� "0 storagefilepath storageFilePath��  ��  ; o   
 ���� 0 filemanager fileManager��  ��  7 k    �>> ?@? r    %ABA n   #CDC I    #��E���� 20 datawithcontentsoffile_ dataWithContentsOfFile_E F��F o    ���� "0 storagefilepath storageFilePath��  ��  D n   GHG o    ���� 0 nsdata NSDataH m    ��
�� misccuraB o      ���� 0 	plistdata 	plistData@ IJI r   & @KLK n  & 1MNM I   ) 1��O���� X0 *propertylistwithdata_options_format_error_ *propertyListWithData_options_format_error_O PQP o   ) *���� 0 	plistdata 	plistDataQ RSR m   * +����  S TUT l  + ,V����V m   + ,��
�� 
msng��  ��  U W��W l  , -X����X m   , -��
�� 
obj ��  ��  ��  ��  N n  & )YZY o   ' )���� :0 nspropertylistserialization NSPropertyListSerializationZ m   & '��
�� misccuraL J      [[ \]\ o      ���� 20 loadednotificationtimes loadedNotificationTimes] ^��^ o      ���� 0 theerror theError��  J _��_ Z   A �`a��b` >  A Dcdc o   A B���� 20 loadednotificationtimes loadedNotificationTimesd m   B C��
�� 
msnga k   G �ee fgf r   G Nhih n  G Ljkj I   H L�������� 0 mutablecopy mutableCopy��  ��  k o   G H���� 20 loadednotificationtimes loadedNotificationTimesi o      ���� .0 lastnotificationtimes lastNotificationTimesg lml l  O O��������  ��  ��  m non l  O O��pq��  p ? 9 Clean the last records in case they have already expired   q �rr r   C l e a n   t h e   l a s t   r e c o r d s   i n   c a s e   t h e y   h a v e   a l r e a d y   e x p i r e do sts r   O Vuvu I  O T������
�� .misccurdldt    ��� null��  ��  v o      ���� 0 currentdate currentDatet w��w X   W �x��yx k   q �zz {|{ r   q y}~} l  q w���� n  q w��� I   r w������ 0 objectforkey_ objectForKey_� ��~� o   r s�}�} 0 serial_number  �~  �  � o   q r�|�| .0 lastnotificationtimes lastNotificationTimes��  ��  ~ o      �{�{ $0 notificationtime notificationTime| ��z� Z   z ����y�x� >  z }��� o   z {�w�w $0 notificationtime notificationTime� m   { |�v
�v 
msng� Z   � ����u�t� ?   � ���� l  � ���s�r� \   � ���� o   � ��q�q 0 currentdate currentDate� o   � ��p�p $0 notificationtime notificationTime�s  �r  � l  � ���o�n� ]   � ���� o   � ��m�m V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed� 1   � ��l
�l 
hour�o  �n  � k   � ��� ��� l  � ��k���k  � ` Z More than X hours have passed, the last notification time has expired, and we can drop it   � ��� �   M o r e   t h a n   X   h o u r s   h a v e   p a s s e d ,   t h e   l a s t   n o t i f i c a t i o n   t i m e   h a s   e x p i r e d ,   a n d   w e   c a n   d r o p   i t� ��j� l  � ���i�h� n  � ���� I   � ��g��f�g *0 removeobjectforkey_ removeObjectForKey_� ��e� o   � ��d�d 0 serial_number  �e  �f  � o   � ��c�c .0 lastnotificationtimes lastNotificationTimes�i  �h  �j  �u  �t  �y  �x  �z  �� 0 serial_number  y l  Z c��b�a� c   Z c��� l  Z _��`�_� n  Z _��� I   [ _�^�]�\�^ 0 allkeys allKeys�]  �\  � o   Z [�[�[ .0 lastnotificationtimes lastNotificationTimes�`  �_  � m   _ b�Z
�Z 
list�b  �a  ��  ��  b r   � ���� n  � ���� I   � ��Y�X�W�Y 0 
dictionary  �X  �W  � n  � ���� o   � ��V�V *0 nsmutabledictionary NSMutableDictionary� m   � ��U
�U misccura� o      �T�T .0 lastnotificationtimes lastNotificationTimes��  ��  8 r   � ���� n  � ���� I   � ��S�R�Q�S 0 
dictionary  �R  �Q  � n  � ���� o   � ��P�P *0 nsmutabledictionary NSMutableDictionary� m   � ��O
�O misccura� o      �N�N .0 lastnotificationtimes lastNotificationTimes��  ) ��� l     �M�L�K�M  �L  �K  � ��� l     �J���J  � : 4 Native AppleScript method to display a notification   � ��� h   N a t i v e   A p p l e S c r i p t   m e t h o d   t o   d i s p l a y   a   n o t i f i c a t i o n� ��� i   d g��� I      �I��H�I $0 shownotification showNotification� ��� o      �G�G 0 message  � ��F� o      �E�E 	0 title  �F  �H  � I    �D��
�D .sysonotfnull��� ��� TEXT� o     �C�C 0 message  � �B��A
�B 
appr� o    �@�@ 	0 title  �A  � ��?� l     �>�=�<�>  �=  �<  �?       �;���:�9�8����������;  � �7�6�5�4�3�2�1�0�/�.�-�,�+
�7 
pimr�6 0 this  �5 V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed�4 0 	threshold  �3 "0 storagefilepath storageFilePath
�2 .aevtoappnull  �   � ****�1 0 extractfield extractField�0 40 removenondigitcharacters removeNonDigitCharacters�/ 0 removequotes removeQuotes�. 80 updatelastnotificationtime updateLastNotificationTime�- .0 savenotificationtimes saveNotificationTimes�, .0 loadnotificationtimes loadNotificationTimes�+ $0 shownotification showNotification� �*��* �  ����� �) �(
�) 
vers�(  � �'��&
�' 
cobj� ��   �% 
�% 
frmk�&  � �$��#
�$ 
cobj� ��   �" 
�" 
frmk�#  � �!�� 
�! 
cobj� ��   �
� 
osax�   
�: misccura�9 �8 � ��� � / U s e r s / a n d r e a / L i b r a r y / P r e f e r e n c e s / o r g . a l b e r t i 4 2 . m a g i c - w a r n i n g s . p l i s t� � a�����
� .aevtoappnull  �   � ****�  �  � �� 0 line  � !� w����� �� �� ����� � �� � � � ����
 �	���� .0 loadnotificationtimes loadNotificationTimes� 0 ioregcmd ioregCmd
� .sysoexecTEXT���     TEXT� 0 ioreg_output  
� 
cpar� 0 outputlines outputLines� 0 product_name  � 0 serial_number  � 0 battery_percent  
� 
kocl
� 
cobj
� .corecnte****       ****� 0 extractfield extractField� 40 removenondigitcharacters removeNonDigitCharacters
� 
long�
 *0 notificationmessage notificationMessage�	 &0 notificationtitle notificationTitle� $0 shownotification showNotification� 80 updatelastnotificationtime updateLastNotificationTime� .0 savenotificationtimes saveNotificationTimes� �)j+  O�E�O�j E�O��-E�O�E�O�E�O�E�O ��[��l kh  �a  )�a l+ E�Y hO�a  )�a l+ E�Y hO�a  V)�a l+ E�O)�k+ E�O�a &b   /a �%a %E` O�a %E` O)_ _ l+ O)�k+ Y hY h[OY�mO)j+  � �C������ 0 extractfield extractField� ��� �  � ���  0 line  �� 0 	fieldname 	fieldName�  � ���������� 0 line  �� 0 	fieldname 	fieldName�� 
0 prefix  �� 0 
fieldvalue 
fieldValue� 
QS����������������
�� 
ctxt
�� misccura
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
leng�� 0 removequotes removeQuotes� 3�%�%E�O�[�\[Z� *��� U��,\Zi2E�O)�k+ 	E�O�� ��}���������� 40 removenondigitcharacters removeNonDigitCharacters�� ����� �  ���� 0 inputstring inputString��  � �������� 0 inputstring inputString�� 0 nsstring NSString�� 0 
digitsonly 
digitsOnly� 	������������������ 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 nsregularexpressionsearch NSRegularExpressionSearch�� 
0 length  �� �� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�� 
ctxt�� -b  �,�k+ E�O���b  �,j�j+ lv�+ E�O��&� ������������� 0 removequotes removeQuotes�� ����� �  ���� 0 inputstring inputString��  � �������� 0 inputstring inputString�� 0 nsstring NSString�� 0 resultstring resultString� ������������ 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_
�� 
ctxt�� b  �,�k+ E�O���l+ E�O��&� ������������� 80 updatelastnotificationtime updateLastNotificationTime�� ����� �  ���� 0 serial_number  ��  � ������ 0 serial_number  �� 0 currentdate currentDate� ������
�� .misccurdldt    ��� null�� .0 lastnotificationtimes lastNotificationTimes�� &0 setobject_forkey_ setObject_forKey_�� *j  E�O���l+ � ������������ .0 savenotificationtimes saveNotificationTimes��  ��  � ���� 0 	plistdata 	plistData� ����������������
�� misccura�� :0 nspropertylistserialization NSPropertyListSerialization�� .0 lastnotificationtimes lastNotificationTimes�� <0 nspropertylistxmlformat_v1_0 NSPropertyListXMLFormat_v1_0
�� 
msng�� �� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_�� 20 writetofile_atomically_ writeToFile_atomically_�� ��,���,j��+ E�O�b  el+ E�� ��+���������� .0 loadnotificationtimes loadNotificationTimes��  ��  � ���������������� 0 filemanager fileManager�� 0 	plistdata 	plistData�� 20 loadednotificationtimes loadedNotificationTimes�� 0 theerror theError�� 0 currentdate currentDate�� 0 serial_number  �� $0 notificationtime notificationTime� ������������������������������������������������
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� &0 fileexistsatpath_ fileExistsAtPath_�� 0 nsdata NSData�� 20 datawithcontentsoffile_ dataWithContentsOfFile_�� :0 nspropertylistserialization NSPropertyListSerialization
�� 
msng
�� 
obj �� �� X0 *propertylistwithdata_options_format_error_ *propertyListWithData_options_format_error_
�� 
cobj�� 0 mutablecopy mutableCopy�� .0 lastnotificationtimes lastNotificationTimes
�� .misccurdldt    ��� null�� 0 allkeys allKeys
�� 
list
�� 
kocl
�� .corecnte****       ****�� 0 objectforkey_ objectForKey_
�� 
hour�� *0 removeobjectforkey_ removeObjectForKey_�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  �� ���,j+ E�O�b  k+  ���,b  k+ E�O��,�j���+ 
E[�k/E�Z[�l/E�ZO�� a�j+ E�O*j E�O K�j+ a &[a �l kh ͥk+ E�O�� ��b  _   ͥk+ Y hY h[OY��Y �a ,j+ E�Y �a ,j+ E�� ������������� $0 shownotification showNotification�� ����� �  ������ 0 message  �� 	0 title  ��  � ������ 0 message  �� 	0 title  � ����
�� 
appr
�� .sysonotfnull��� ��� TEXT�� ��l ascr  ��ޭ