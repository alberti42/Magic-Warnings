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
�� misccura '  * + * l     ��������  ��  ��   +  , - , l     �� . /��   . W Q Disable warnings before so many hours have passed since the last warning message    / � 0 0 �   D i s a b l e   w a r n i n g s   b e f o r e   s o   m a n y   h o u r s   h a v e   p a s s e d   s i n c e   t h e   l a s t   w a r n i n g   m e s s a g e -  1 2 1 j   1 3�� 3�� V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed 3 m   1 2����  2  4 5 4 l     ��������  ��  ��   5  6 7 6 l     �� 8 9��   8 0 * Define the threshold for battery warnings    9 � : : T   D e f i n e   t h e   t h r e s h o l d   f o r   b a t t e r y   w a r n i n g s 7  ; < ; j   4 6�� =�� 0 	threshold   = m   4 5����  <  > ? > l     ��������  ��  ��   ?  @ A @ l     �� B C��   B _ Y Path to the file where the dictionary will be saved in the user's ~/Library/Preferences/    C � D D �   P a t h   t o   t h e   f i l e   w h e r e   t h e   d i c t i o n a r y   w i l l   b e   s a v e d   i n   t h e   u s e r ' s   ~ / L i b r a r y / P r e f e r e n c e s / A  E F E j   7 G�� G�� "0 storagefilepath storageFilePath G b   7 F H I H n   7 B J K J 1   > B��
�� 
psxp K l  7 > L���� L I  7 >�� M N
�� .earsffdralis        afdr M m   7 8��
�� afdrdlib N �� O��
�� 
from O m   9 :��
�� fldmfldu��  ��  ��   I m   B E P P � Q Q \ P r e f e r e n c e s / o r g . a l b e r t i 4 2 . m a g i c - w a r n i n g s . p l i s t F  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V V P Dictionary to store the last notification time for each device by serial number    W � X X �   D i c t i o n a r y   t o   s t o r e   t h e   l a s t   n o t i f i c a t i o n   t i m e   f o r   e a c h   d e v i c e   b y   s e r i a l   n u m b e r U  Y Z Y p   H H [ [ ������ .0 lastnotificationtimes lastNotificationTimes��   Z  \ ] \ l     ��������  ��  ��   ]  ^ _ ^ i   H K ` a ` I     ������
�� .aevtoappnull  �   � ****��  ��   a k     b b  c d c l     �� e f��   e D > Load the last notification times from the file (if it exists)    f � g g |   L o a d   t h e   l a s t   n o t i f i c a t i o n   t i m e s   f r o m   t h e   f i l e   ( i f   i t   e x i s t s ) d  h i h n     j k j I    �������� .0 loadnotificationtimes loadNotificationTimes��  ��   k  f      i  l m l l   ��������  ��  ��   m  n o n l   �� p q��   p M G Get the list of all devices under AppleDeviceManagementHIDEventService    q � r r �   G e t   t h e   l i s t   o f   a l l   d e v i c e s   u n d e r   A p p l e D e v i c e M a n a g e m e n t H I D E v e n t S e r v i c e o  s t s r    	 u v u m     w w � x x z / u s r / s b i n / i o r e g   - c   A p p l e D e v i c e M a n a g e m e n t H I D E v e n t S e r v i c e   - r   - l v o      ���� 0 ioregcmd ioregCmd t  y z y r   
  { | { I  
 �� }��
�� .sysoexecTEXT���     TEXT } o   
 ���� 0 ioregcmd ioregCmd��   | o      ���� 0 ioreg_output   z  ~  ~ l   ��������  ��  ��     � � � l   �� � ���   � "  Split the output into lines    � � � � 8   S p l i t   t h e   o u t p u t   i n t o   l i n e s �  � � � r     � � � n     � � � 2   ��
�� 
cpar � o    ���� 0 ioreg_output   � o      ���� 0 outputlines outputLines �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � 6 0 Initialize variables for processing each device    � � � � `   I n i t i a l i z e   v a r i a b l e s   f o r   p r o c e s s i n g   e a c h   d e v i c e �  � � � r     � � � m     � � � � �   � o      ���� 0 product_name   �  � � � r     � � � m     � � � � �   � o      ���� 0 serial_number   �  � � � r     # � � � m     ! � � � � �   � o      ���� 0 battery_percent   �  � � � r   $ ' � � � m   $ % � � � � �   � o      ���� 0 	transport   �  � � � l  ( (��������  ��  ��   �  � � � X   ( ��� � � k   :  � �  � � � l  : :��������  ��  ��   �  � � � l  : :�� � ���   � #  Extract the transport method    � � � � :   E x t r a c t   t h e   t r a n s p o r t   m e t h o d �  � � � Z   : Q � ����� � E   : ? � � � o   : ;���� 0 line   � m   ; > � � � � �  " T r a n s p o r t " � r   B M � � � n  B K � � � I   C K�� ����� 0 extractfield extractField �  � � � o   C D���� 0 line   �  ��� � m   D G � � � � �  T r a n s p o r t��  ��   �  f   B C � o      ���� 0 	transport  ��  ��   �  � � � l  R R��������  ��  ��   �  � � � l  R R�� � ���   � � � Only check the status for bluetooth devices; we do not need to check the battery for the Magic devices when charging on a USB connection    � � � �   O n l y   c h e c k   t h e   s t a t u s   f o r   b l u e t o o t h   d e v i c e s ;   w e   d o   n o t   n e e d   t o   c h e c k   t h e   b a t t e r y   f o r   t h e   M a g i c   d e v i c e s   w h e n   c h a r g i n g   o n   a   U S B   c o n n e c t i o n �  ��� � Z   R  � ����� � =  R W � � � o   R S���� 0 	transport   � m   S V � � � � �  B l u e t o o t h � k   Z � � �  � � � l  Z Z��������  ��  ��   �  � � � l  Z Z�� � ���   �   Extract the product name    � � � � 2   E x t r a c t   t h e   p r o d u c t   n a m e �  � � � Z   Z q � ����� � E   Z _ � � � o   Z [���� 0 line   � m   [ ^ � � � � �  " P r o d u c t " � r   b m � � � n  b k � � � I   c k�� ����� 0 extractfield extractField �  � � � o   c d���� 0 line   �  ��� � m   d g � � � � �  P r o d u c t��  ��   �  f   b c � o      ���� 0 product_name  ��  ��   �  � � � l  r r��������  ��  ��   �  � � � l  r r�� � ���   �    Extract the serial number    � � � � 4   E x t r a c t   t h e   s e r i a l   n u m b e r �  � � � Z   r � � ����� � E   r w � � � o   r s���� 0 line   � m   s v � � �    " S e r i a l N u m b e r " � r   z � n  z � I   { ���~� 0 extractfield extractField  o   { |�}�} 0 line   �| m   | 		 �

  S e r i a l N u m b e r�|  �~    f   z { o      �{�{ 0 serial_number  ��  ��   �  l  � ��z�y�x�z  �y  �x    l  � ��w�w   %  Extract the battery percentage    � >   E x t r a c t   t h e   b a t t e r y   p e r c e n t a g e  Z   � ��v�u E   � � o   � ��t�t 0 line   m   � � �   " B a t t e r y P e r c e n t " k   � �  r   � � n  � �  I   � ��s!�r�s 0 extractfield extractField! "#" o   � ��q�q 0 line  # $�p$ m   � �%% �&&  B a t t e r y P e r c e n t�p  �r     f   � � o      �o�o 0 battery_percent   '(' r   � �)*) n  � �+,+ I   � ��n-�m�n 40 removenondigitcharacters removeNonDigitCharacters- .�l. o   � ��k�k 0 battery_percent  �l  �m  ,  f   � �* o      �j�j 0 battery_percent  ( /0/ l  � ��i�h�g�i  �h  �g  0 121 l  � ��f34�f  3 q k If the battery percentage is below the threshold, check if 3 hours have passed since the last notification   4 �55 �   I f   t h e   b a t t e r y   p e r c e n t a g e   i s   b e l o w   t h e   t h r e s h o l d ,   c h e c k   i f   3   h o u r s   h a v e   p a s s e d   s i n c e   t h e   l a s t   n o t i f i c a t i o n2 6�e6 Z   � �78�d�c7 B   � �9:9 l  � �;�b�a; c   � �<=< o   � ��`�` 0 battery_percent  = m   � ��_
�_ 
long�b  �a  : o   � ��^�^ 0 	threshold  8 Z   � �>?�]�\> =  � �@A@ l  � �B�[�ZB n  � �CDC I   � ��YE�X�Y 0 objectforkey_ objectForKey_E F�WF o   � ��V�V 0 serial_number  �W  �X  D o   � ��U�U .0 lastnotificationtimes lastNotificationTimes�[  �Z  A m   � ��T
�T 
msng? k   � �GG HIH l  � ��SJK�S  J ( " notification was recently emitted   K �LL D   n o t i f i c a t i o n   w a s   r e c e n t l y   e m i t t e dI MNM r   � �OPO b   � �QRQ b   � �STS m   � �UU �VV   B a t t e r y   s t a t u s :  T o   � ��R�R 0 battery_percent  R m   � �WW �XX  %P o      �Q�Q *0 notificationmessage notificationMessageN YZY r   � �[\[ b   � �]^] o   � ��P�P 0 product_name  ^ m   � �__ �``    b a t t e r y   l o w\ o      �O�O &0 notificationtitle notificationTitleZ aba n  � �cdc I   � ��Ne�M�N $0 shownotification showNotificatione fgf o   � ��L�L *0 notificationmessage notificationMessageg h�Kh o   � ��J�J &0 notificationtitle notificationTitle�K  �M  d  f   � �b i�Ii n  � �jkj I   � ��Hl�G�H 80 updatelastnotificationtime updateLastNotificationTimel m�Fm o   � ��E�E 0 serial_number  �F  �G  k  f   � ��I  �]  �\  �d  �c  �e  �v  �u   n�Dn l  � ��C�B�A�C  �B  �A  �D  ��  ��  ��  �� 0 line   � o   + ,�@�@ 0 outputlines outputLines � opo l �?�>�=�?  �>  �=  p qrq l �<st�<  s 6 0 Save the updated notification times to the file   t �uu `   S a v e   t h e   u p d a t e d   n o t i f i c a t i o n   t i m e s   t o   t h e   f i l er v�;v n wxw I  �:�9�8�: .0 savenotificationtimes saveNotificationTimes�9  �8  x  f  �;   _ yzy l     �7�6�5�7  �6  �5  z {|{ l     �4}~�4  } A ; Helper method to extract a field value from a line of text   ~ � v   H e l p e r   m e t h o d   t o   e x t r a c t   a   f i e l d   v a l u e   f r o m   a   l i n e   o f   t e x t| ��� i   L O��� I      �3��2�3 0 extractfield extractField� ��� o      �1�1 0 line  � ��0� o      �/�/ 0 	fieldname 	fieldName�0  �2  � k     2�� ��� r     ��� b     ��� b     ��� m     �� ���  "� o    �.�. 0 	fieldname 	fieldName� m    �� ���  "   =  � o      �-�- 
0 prefix  � ��� r    &��� n    $��� 7  	 $�,��
�, 
ctxt� l    ��+�*� [     ��� l   ��)�(� I   ��'�� z�&�%
�& .sysooffslong    ��� null
�% misccura�'  � �$��
�$ 
psof� o    �#�# 
0 prefix  � �"��!
�" 
psin� o    � �  0 line  �!  �)  �(  � l   ���� n    ��� 1    �
� 
leng� o    �� 
0 prefix  �  �  �+  �*  � m   ! #����� o    	�� 0 line  � o      �� 0 
fieldvalue 
fieldValue� ��� r   ' /��� n  ' -��� I   ( -���� 0 removequotes removeQuotes� ��� o   ( )�� 0 
fieldvalue 
fieldValue�  �  �  f   ' (� o      �� 0 
fieldvalue 
fieldValue� ��� L   0 2�� o   0 1�� 0 
fieldvalue 
fieldValue�  � ��� l     ����  �  �  � ��� l     ����  � 3 - Helper method to remove non-digit characters   � ��� Z   H e l p e r   m e t h o d   t o   r e m o v e   n o n - d i g i t   c h a r a c t e r s� ��� i   P S��� I      ���� 40 removenondigitcharacters removeNonDigitCharacters� ��� o      �
�
 0 inputstring inputString�  �  � k     ,�� ��� r     ��� l    ��	�� n    ��� I    ���� &0 stringwithstring_ stringWithString_� ��� o    �� 0 inputstring inputString�  �  � n    ��� o    �� 0 nsstring NSString� o     �� 0 this  �	  �  � o      �� 0 nsstring NSString� ��� r    '��� l   %�� ��� n   %��� I    %������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m    �� ���  [ ^ 0 - 9 ]� ��� m    �� ���  � ��� l   ������ n   ��� o    ���� 60 nsregularexpressionsearch NSRegularExpressionSearch� o    ���� 0 this  ��  ��  � ���� J    !�� ��� m    ����  � ���� n   ��� I    �������� 
0 length  ��  ��  � o    ���� 0 nsstring NSString��  ��  ��  � o    ���� 0 nsstring NSString�   ��  � o      ���� 0 
digitsonly 
digitsOnly� ���� L   ( ,�� c   ( +��� o   ( )���� 0 
digitsonly 
digitsOnly� m   ) *��
�� 
ctxt��  � ��� l     ��������  ��  ��  � ��� l     ������  � 3 - Helper method to remove quotes from a string   � ��� Z   H e l p e r   m e t h o d   t o   r e m o v e   q u o t e s   f r o m   a   s t r i n g� ��� i   T W��� I      ������� 0 removequotes removeQuotes� ���� o      ���� 0 inputstring inputString��  ��  � k     �� ��� r     ��� l    ������ n    � � I    ������ &0 stringwithstring_ stringWithString_ �� o    ���� 0 inputstring inputString��  ��    n     o    ���� 0 nsstring NSString o     ���� 0 this  ��  ��  � o      ���� 0 nsstring NSString�  r     l   	����	 n   

 I    ������ d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_  m     �  " �� m     �  ��  ��   o    ���� 0 nsstring NSString��  ��   o      ���� 0 resultstring resultString �� L     c     o    ���� 0 resultstring resultString m    ��
�� 
ctxt��  �  l     ��������  ��  ��    l     ����   9 3 Helper method to update the last notification time    � f   H e l p e r   m e t h o d   t o   u p d a t e   t h e   l a s t   n o t i f i c a t i o n   t i m e   i   X [!"! I      ��#���� 80 updatelastnotificationtime updateLastNotificationTime# $��$ o      ���� 0 serial_number  ��  ��  " k     %% &'& r     ()( I    ������
�� .misccurdldt    ��� null��  ��  ) o      ���� 0 currentdate currentDate' *+* l   ��������  ��  ��  + ,-, l   ��./��  . B < Set the current date as the value for the serial number key   / �00 x   S e t   t h e   c u r r e n t   d a t e   a s   t h e   v a l u e   f o r   t h e   s e r i a l   n u m b e r   k e y- 1��1 n   232 I   	 ��4���� &0 setobject_forkey_ setObject_forKey_4 565 o   	 
���� 0 currentdate currentDate6 7��7 o   
 ���� 0 serial_number  ��  ��  3 o    	���� .0 lastnotificationtimes lastNotificationTimes��    898 l     ��������  ��  ��  9 :;: l     ��<=��  < J D Save notification times to a file using NSPropertyListSerialization   = �>> �   S a v e   n o t i f i c a t i o n   t i m e s   t o   a   f i l e   u s i n g   N S P r o p e r t y L i s t S e r i a l i z a t i o n; ?@? i   \ _ABA I      �������� .0 savenotificationtimes saveNotificationTimes��  ��  B k     CC DED r     FGF n    HIH I    ��J���� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_J KLK o    ���� .0 lastnotificationtimes lastNotificationTimesL MNM l   O����O n   PQP o    ���� <0 nspropertylistxmlformat_v1_0 NSPropertyListXMLFormat_v1_0Q m    ��
�� misccura��  ��  N RSR m    ����  S T��T l   	U����U m    	��
�� 
msng��  ��  ��  ��  I n    VWV o    ���� :0 nspropertylistserialization NSPropertyListSerializationW m     ��
�� misccuraG o      ���� 0 	plistdata 	plistDataE X��X r    YZY n   [\[ I    ��]���� 20 writetofile_atomically_ writeToFile_atomically_] ^_^ o    ���� "0 storagefilepath storageFilePath_ `��` m    ��
�� boovtrue��  ��  \ o    ���� 0 	plistdata 	plistDataZ o      ���� 0 	plistdata 	plistData��  @ aba l     ��������  ��  ��  b cdc l     ��ef��  e N H Load notification times from the file using NSPropertyListSerialization   f �gg �   L o a d   n o t i f i c a t i o n   t i m e s   f r o m   t h e   f i l e   u s i n g   N S P r o p e r t y L i s t S e r i a l i z a t i o nd hih i   ` cjkj I      �������� .0 loadnotificationtimes loadNotificationTimes��  ��  k k     �ll mnm r     	opo n    qrq I    ��������  0 defaultmanager defaultManager��  ��  r n    sts o    ���� 0 nsfilemanager NSFileManagert m     ��
�� misccurap o      ���� 0 filemanager fileManagern u��u Z   
 �vw��xv l  
 y����y n  
 z{z I    ��|���� &0 fileexistsatpath_ fileExistsAtPath_| }��} o    ���� "0 storagefilepath storageFilePath��  ��  { o   
 ���� 0 filemanager fileManager��  ��  w k    �~~ � r    %��� n   #��� I    #������� 20 datawithcontentsoffile_ dataWithContentsOfFile_� ���� o    ���� "0 storagefilepath storageFilePath��  ��  � n   ��� o    ���� 0 nsdata NSData� m    ��
�� misccura� o      ���� 0 	plistdata 	plistData� ��� r   & @��� n  & 1��� I   ) 1���~� X0 *propertylistwithdata_options_format_error_ *propertyListWithData_options_format_error_� ��� o   ) *�}�} 0 	plistdata 	plistData� ��� m   * +�|�|  � ��� l  + ,��{�z� m   + ,�y
�y 
msng�{  �z  � ��x� l  , -��w�v� m   , -�u
�u 
obj �w  �v  �x  �~  � n  & )��� o   ' )�t�t :0 nspropertylistserialization NSPropertyListSerialization� m   & '�s
�s misccura� J      �� ��� o      �r�r 20 loadednotificationtimes loadedNotificationTimes� ��q� o      �p�p 0 theerror theError�q  � ��o� Z   A ����n�� >  A D��� o   A B�m�m 20 loadednotificationtimes loadedNotificationTimes� m   B C�l
�l 
msng� k   G ��� ��� r   G N��� n  G L��� I   H L�k�j�i�k 0 mutablecopy mutableCopy�j  �i  � o   G H�h�h 20 loadednotificationtimes loadedNotificationTimes� o      �g�g .0 lastnotificationtimes lastNotificationTimes� ��� l  O O�f�e�d�f  �e  �d  � ��� l  O O�c���c  � ? 9 Clean the last records in case they have already expired   � ��� r   C l e a n   t h e   l a s t   r e c o r d s   i n   c a s e   t h e y   h a v e   a l r e a d y   e x p i r e d� ��� r   O V��� I  O T�b�a�`
�b .misccurdldt    ��� null�a  �`  � o      �_�_ 0 currentdate currentDate� ��^� X   W ���]�� k   q ��� ��� r   q y��� l  q w��\�[� n  q w��� I   r w�Z��Y�Z 0 objectforkey_ objectForKey_� ��X� o   r s�W�W 0 serial_number  �X  �Y  � o   q r�V�V .0 lastnotificationtimes lastNotificationTimes�\  �[  � o      �U�U $0 notificationtime notificationTime� ��T� Z   z ����S�R� >  z }��� o   z {�Q�Q $0 notificationtime notificationTime� m   { |�P
�P 
msng� Z   � ����O�N� ?   � ���� l  � ���M�L� \   � ���� o   � ��K�K 0 currentdate currentDate� o   � ��J�J $0 notificationtime notificationTime�M  �L  � l  � ���I�H� ]   � ���� o   � ��G�G V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed� 1   � ��F
�F 
hour�I  �H  � k   � ��� ��� l  � ��E���E  � ` Z More than X hours have passed, the last notification time has expired, and we can drop it   � ��� �   M o r e   t h a n   X   h o u r s   h a v e   p a s s e d ,   t h e   l a s t   n o t i f i c a t i o n   t i m e   h a s   e x p i r e d ,   a n d   w e   c a n   d r o p   i t� ��D� l  � ���C�B� n  � ���� I   � ��A��@�A *0 removeobjectforkey_ removeObjectForKey_� ��?� o   � ��>�> 0 serial_number  �?  �@  � o   � ��=�= .0 lastnotificationtimes lastNotificationTimes�C  �B  �D  �O  �N  �S  �R  �T  �] 0 serial_number  � l  Z c��<�;� c   Z c��� l  Z _��:�9� n  Z _��� I   [ _�8�7�6�8 0 allkeys allKeys�7  �6  � o   Z [�5�5 .0 lastnotificationtimes lastNotificationTimes�:  �9  � m   _ b�4
�4 
list�<  �;  �^  �n  � r   � ���� n  � ���� I   � ��3�2�1�3 0 
dictionary  �2  �1  � n  � ���� o   � ��0�0 *0 nsmutabledictionary NSMutableDictionary� m   � ��/
�/ misccura� o      �.�. .0 lastnotificationtimes lastNotificationTimes�o  ��  x r   � ���� n  � ���� I   � ��-�,�+�- 0 
dictionary  �,  �+  � n  � ���� o   � ��*�* *0 nsmutabledictionary NSMutableDictionary� m   � ��)
�) misccura� o      �(�( .0 lastnotificationtimes lastNotificationTimes��  i ��� l     �'�&�%�'  �&  �%  � ��� l     �$���$  � : 4 Native AppleScript method to display a notification   � ��� h   N a t i v e   A p p l e S c r i p t   m e t h o d   t o   d i s p l a y   a   n o t i f i c a t i o n� ��� i   d g��� I      �#��"�# $0 shownotification showNotification� ��� o      �!�! 0 message  � �� � o      �� 	0 title  �   �"  � I    � 
� .sysonotfnull��� ��� TEXT  o     �� 0 message   ��
� 
appr o    �� 	0 title  �  � � l     ����  �  �  �       ����	
�   ��������
�	����
� 
pimr� 0 this  � V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed� 0 	threshold  � "0 storagefilepath storageFilePath
� .aevtoappnull  �   � ****� 0 extractfield extractField�
 40 removenondigitcharacters removeNonDigitCharacters�	 0 removequotes removeQuotes� 80 updatelastnotificationtime updateLastNotificationTime� .0 savenotificationtimes saveNotificationTimes� .0 loadnotificationtimes loadNotificationTimes� $0 shownotification showNotification ��    � �
� 
vers�   �� 
� 
cobj    �� 
�� 
frmk�    ����
�� 
cobj    �� 
�� 
frmk��   ����
�� 
cobj    ��
�� 
osax��  
� misccura� �  � � / U s e r s / a n d r e a / L i b r a r y / P r e f e r e n c e s / o r g . a l b e r t i 4 2 . m a g i c - w a r n i n g s . p l i s t �� a������
�� .aevtoappnull  �   � ****��  ��   ���� 0 line   )�� w���������� ��� ��� ��� ��������� � ��� � � � �	%����������UW��_���������� .0 loadnotificationtimes loadNotificationTimes�� 0 ioregcmd ioregCmd
�� .sysoexecTEXT���     TEXT�� 0 ioreg_output  
�� 
cpar�� 0 outputlines outputLines�� 0 product_name  �� 0 serial_number  �� 0 battery_percent  �� 0 	transport  
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 extractfield extractField�� 40 removenondigitcharacters removeNonDigitCharacters
�� 
long�� .0 lastnotificationtimes lastNotificationTimes�� 0 objectforkey_ objectForKey_
�� 
msng�� *0 notificationmessage notificationMessage�� &0 notificationtitle notificationTitle�� $0 shownotification showNotification�� 80 updatelastnotificationtime updateLastNotificationTime�� .0 savenotificationtimes saveNotificationTimes��)j+  O�E�O�j E�O��-E�O�E�O�E�O�E�O�E�O ��[�a l kh  �a  )�a l+ E�Y hO�a   ��a  )�a l+ E�Y hO�a  )�a l+ E�Y hO�a  i)�a l+ E�O)�k+ E�O�a &b   B_ �k+ a    /a !�%a "%E` #O�a $%E` %O)_ #_ %l+ &O)�k+ 'Y hY hY hOPY h[OY�4O)j+ ( ����������� 0 extractfield extractField�� ����   ������ 0 line  �� 0 	fieldname 	fieldName��   ���������� 0 line  �� 0 	fieldname 	fieldName�� 
0 prefix  �� 0 
fieldvalue 
fieldValue 
������������������
�� 
ctxt
�� misccura
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
leng�� 0 removequotes removeQuotes�� 3�%�%E�O�[�\[Z� *��� U��,\Zi2E�O)�k+ 	E�O�	 ������� !���� 40 removenondigitcharacters removeNonDigitCharacters�� ��"�� "  ���� 0 inputstring inputString��    �������� 0 inputstring inputString�� 0 nsstring NSString�� 0 
digitsonly 
digitsOnly! 	������������������ 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 nsregularexpressionsearch NSRegularExpressionSearch�� 
0 length  �� �� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�� 
ctxt�� -b  �,�k+ E�O���b  �,j�j+ lv�+ E�O��&
 �������#$���� 0 removequotes removeQuotes�� ��%�� %  ���� 0 inputstring inputString��  # �������� 0 inputstring inputString�� 0 nsstring NSString�� 0 resultstring resultString$ ���������� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_
�� 
ctxt�� b  �,�k+ E�O���l+ E�O��& ��"����&'���� 80 updatelastnotificationtime updateLastNotificationTime�� ��(�� (  ���� 0 serial_number  ��  & ������ 0 serial_number  �� 0 currentdate currentDate' ������
�� .misccurdldt    ��� null�� .0 lastnotificationtimes lastNotificationTimes�� &0 setobject_forkey_ setObject_forKey_�� *j  E�O���l+  ��B����)*���� .0 savenotificationtimes saveNotificationTimes��  ��  ) ���� 0 	plistdata 	plistData* ����������������
�� misccura�� :0 nspropertylistserialization NSPropertyListSerialization�� .0 lastnotificationtimes lastNotificationTimes�� <0 nspropertylistxmlformat_v1_0 NSPropertyListXMLFormat_v1_0
�� 
msng�� �� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_�� 20 writetofile_atomically_ writeToFile_atomically_�� ��,���,j��+ E�O�b  el+ E� ��k����+,���� .0 loadnotificationtimes loadNotificationTimes��  ��  + ���������������� 0 filemanager fileManager�� 0 	plistdata 	plistData�� 20 loadednotificationtimes loadedNotificationTimes�� 0 theerror theError�� 0 currentdate currentDate�� 0 serial_number  �� $0 notificationtime notificationTime, ��������������������~�}�|�{�z�y�x�w�v�u�t�s�r�q
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� &0 fileexistsatpath_ fileExistsAtPath_�� 0 nsdata NSData�� 20 datawithcontentsoffile_ dataWithContentsOfFile_�� :0 nspropertylistserialization NSPropertyListSerialization
�� 
msng
�� 
obj � �~ X0 *propertylistwithdata_options_format_error_ *propertyListWithData_options_format_error_
�} 
cobj�| 0 mutablecopy mutableCopy�{ .0 lastnotificationtimes lastNotificationTimes
�z .misccurdldt    ��� null�y 0 allkeys allKeys
�x 
list
�w 
kocl
�v .corecnte****       ****�u 0 objectforkey_ objectForKey_
�t 
hour�s *0 removeobjectforkey_ removeObjectForKey_�r *0 nsmutabledictionary NSMutableDictionary�q 0 
dictionary  �� ���,j+ E�O�b  k+  ���,b  k+ E�O��,�j���+ 
E[�k/E�Z[�l/E�ZO�� a�j+ E�O*j E�O K�j+ a &[a �l kh ͥk+ E�O�� ��b  _   ͥk+ Y hY h[OY��Y �a ,j+ E�Y �a ,j+ E� �p��o�n-.�m�p $0 shownotification showNotification�o �l/�l /  �k�j�k 0 message  �j 	0 title  �n  - �i�h�i 0 message  �h 	0 title  . �g�f
�g 
appr
�f .sysonotfnull��� ��� TEXT�m ��l  ascr  ��ޭ