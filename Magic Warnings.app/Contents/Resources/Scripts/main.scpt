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
cpar � o    ���� 0 ioreg_output   � o      ���� 0 outputlines outputLines �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � 6 0 Initialize variables for processing each device    � � � � `   I n i t i a l i z e   v a r i a b l e s   f o r   p r o c e s s i n g   e a c h   d e v i c e �  � � � r     � � � m     � � � � �   � o      ���� 0 product_name   �  � � � r     � � � m     � � � � �   � o      ���� 0 serial_number   �  � � � r     # � � � m     ! � � � � �   � o      ���� 0 battery_percent   �  � � � l  $ $��������  ��  ��   �  � � � X   $ � ��� � � k   4 � � �  � � � l  4 4�� � ���   �   Extract the product name    � � � � 2   E x t r a c t   t h e   p r o d u c t   n a m e �  � � � Z   4 K � ����� � E   4 9 � � � o   4 5���� 0 line   � m   5 8 � � � � �  " P r o d u c t " � r   < G � � � n  < E � � � I   = E�� ����� 0 extractfield extractField �  � � � o   = >���� 0 line   �  ��� � m   > A � � � � �  P r o d u c t��  ��   �  f   < = � o      ���� 0 product_name  ��  ��   �  � � � l  L L��������  ��  ��   �  � � � l  L L�� � ���   �    Extract the serial number    � � � � 4   E x t r a c t   t h e   s e r i a l   n u m b e r �  � � � Z   L c � ����� � E   L Q � � � o   L M���� 0 line   � m   M P � � � � �  " S e r i a l N u m b e r " � r   T _ � � � n  T ] � � � I   U ]�� ����� 0 extractfield extractField �  � � � o   U V���� 0 line   �  ��� � m   V Y � � � � �  S e r i a l N u m b e r��  ��   �  f   T U � o      ���� 0 serial_number  ��  ��   �  � � � l  d d��������  ��  ��   �  � � � l  d d�� � ���   � %  Extract the battery percentage    � � � � >   E x t r a c t   t h e   b a t t e r y   p e r c e n t a g e �  ��� � Z   d � � ����� � E   d i � � � o   d e���� 0 line   � m   e h � � � � �   " B a t t e r y P e r c e n t " � k   l � � �  � � � r   l w � � � n  l u � � � I   m u�� ����� 0 extractfield extractField �  � � � o   m n���� 0 line   �  ��� � m   n q � � � � �  B a t t e r y P e r c e n t��  ��   �  f   l m � o      ���� 0 battery_percent   �  � � � r   x � � � � n  x ~ � � � I   y ~�� ����� 40 removenondigitcharacters removeNonDigitCharacters �  ��� � o   y z���� 0 battery_percent  ��  ��   �  f   x y � o      ���� 0 battery_percent   �  � � � l  � �����~��  �  �~   �    l  � ��}�}   q k If the battery percentage is below the threshold, check if 3 hours have passed since the last notification    � �   I f   t h e   b a t t e r y   p e r c e n t a g e   i s   b e l o w   t h e   t h r e s h o l d ,   c h e c k   i f   3   h o u r s   h a v e   p a s s e d   s i n c e   t h e   l a s t   n o t i f i c a t i o n �| Z   � ��{ A   � �	
	 l  � ��z�y c   � � o   � ��x�x 0 battery_percent   m   � ��w
�w 
long�z  �y  
 o   � ��v�v 0 	threshold   Z   � ��u�t n  � � I   � ��s�r�s 0 shouldnotify shouldNotify �q o   � ��p�p 0 serial_number  �q  �r    f   � � k   � �  r   � � b   � � b   � � m   � � �   B a t t e r y   s t a t u s :   o   � ��o�o 0 battery_percent   m   � � �    % o      �n�n *0 notificationmessage notificationMessage !"! r   � �#$# b   � �%&% o   � ��m�m 0 product_name  & m   � �'' �((    b a t t e r y   l o w$ o      �l�l &0 notificationtitle notificationTitle" )*) n  � �+,+ I   � ��k-�j�k $0 shownotification showNotification- ./. o   � ��i�i *0 notificationmessage notificationMessage/ 0�h0 o   � ��g�g &0 notificationtitle notificationTitle�h  �j  ,  f   � �* 1�f1 n  � �232 I   � ��e4�d�e 80 updatelastnotificationtime updateLastNotificationTime4 5�c5 o   � ��b�b 0 serial_number  �c  �d  3  f   � ��f  �u  �t  �{   l  � �6�a�`6 n  � �787 I   � ��_9�^�_ *0 removeobjectforkey_ removeObjectForKey_9 :�]: o   � ��\�\ 0 serial_number  �]  �^  8 o   � ��[�[ .0 lastnotificationtimes lastNotificationTimes�a  �`  �|  ��  ��  ��  �� 0 line   � o   ' (�Z�Z 0 outputlines outputLines � ;<; l  � ��Y�X�W�Y  �X  �W  < =>= l  � ��V?@�V  ? 6 0 Save the updated notification times to the file   @ �AA `   S a v e   t h e   u p d a t e d   n o t i f i c a t i o n   t i m e s   t o   t h e   f i l e> B�UB n  � �CDC I   � ��T�S�R�T .0 savenotificationtimes saveNotificationTimes�S  �R  D  f   � ��U   _ EFE l     �Q�P�O�Q  �P  �O  F GHG l     �NIJ�N  I A ; Helper method to extract a field value from a line of text   J �KK v   H e l p e r   m e t h o d   t o   e x t r a c t   a   f i e l d   v a l u e   f r o m   a   l i n e   o f   t e x tH LML i   L ONON I      �MP�L�M 0 extractfield extractFieldP QRQ o      �K�K 0 line  R S�JS o      �I�I 0 	fieldname 	fieldName�J  �L  O k     2TT UVU r     WXW b     YZY b     [\[ m     ]] �^^  "\ o    �H�H 0 	fieldname 	fieldNameZ m    __ �``  "   =  X o      �G�G 
0 prefix  V aba r    &cdc n    $efe 7  	 $�Fgh
�F 
ctxtg l    i�E�Di [     jkj l   l�C�Bl I   m�Anm z�@�?
�@ .sysooffslong    ��� null
�? misccura�A  n �>op
�> 
psofo o    �=�= 
0 prefix  p �<q�;
�< 
psinq o    �:�: 0 line  �;  �C  �B  k l   r�9�8r n    sts 1    �7
�7 
lengt o    �6�6 
0 prefix  �9  �8  �E  �D  h m   ! #�5�5��f o    	�4�4 0 line  d o      �3�3 0 
fieldvalue 
fieldValueb uvu r   ' /wxw n  ' -yzy I   ( -�2{�1�2 0 removequotes removeQuotes{ |�0| o   ( )�/�/ 0 
fieldvalue 
fieldValue�0  �1  z  f   ' (x o      �.�. 0 
fieldvalue 
fieldValuev }�-} L   0 2~~ o   0 1�,�, 0 
fieldvalue 
fieldValue�-  M � l     �+�*�)�+  �*  �)  � ��� l     �(���(  � 3 - Helper method to remove non-digit characters   � ��� Z   H e l p e r   m e t h o d   t o   r e m o v e   n o n - d i g i t   c h a r a c t e r s� ��� i   P S��� I      �'��&�' 40 removenondigitcharacters removeNonDigitCharacters� ��%� o      �$�$ 0 inputstring inputString�%  �&  � k     ,�� ��� r     ��� l    ��#�"� n    ��� I    �!�� �! &0 stringwithstring_ stringWithString_� ��� o    �� 0 inputstring inputString�  �   � n    ��� o    �� 0 nsstring NSString� o     �� 0 this  �#  �"  � o      �� 0 nsstring NSString� ��� r    '��� l   %���� n   %��� I    %���� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m    �� ���  [ ^ 0 - 9 ]� ��� m    �� ���  � ��� l   ���� n   ��� o    �� 60 nsregularexpressionsearch NSRegularExpressionSearch� o    �� 0 this  �  �  � ��� J    !�� ��� m    ��  � ��� n   ��� I    ���� 
0 length  �  �  � o    �� 0 nsstring NSString�  �  �  � o    �� 0 nsstring NSString�  �  � o      �
�
 0 
digitsonly 
digitsOnly� ��	� L   ( ,�� c   ( +��� o   ( )�� 0 
digitsonly 
digitsOnly� m   ) *�
� 
ctxt�	  � ��� l     ����  �  �  � ��� l     ����  � 3 - Helper method to remove quotes from a string   � ��� Z   H e l p e r   m e t h o d   t o   r e m o v e   q u o t e s   f r o m   a   s t r i n g� ��� i   T W��� I      ���� 0 removequotes removeQuotes� �� � o      ���� 0 inputstring inputString�   �  � k     �� ��� r     ��� l    ������ n    ��� I    ������� &0 stringwithstring_ stringWithString_� ���� o    ���� 0 inputstring inputString��  ��  � n    ��� o    ���� 0 nsstring NSString� o     ���� 0 this  ��  ��  � o      ���� 0 nsstring NSString� ��� r    ��� l   ������ n   ��� I    ������� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_� ��� m    �� ���  "� ���� m    �� ���  ��  ��  � o    ���� 0 nsstring NSString��  ��  � o      ���� 0 resultstring resultString� ���� L    �� c    ��� o    ���� 0 resultstring resultString� m    ��
�� 
ctxt��  � ��� l     ��������  ��  ��  � ��� l     ������  � P J Helper method to check if we should notify (i.e., if 3 hours have passed)   � ��� �   H e l p e r   m e t h o d   t o   c h e c k   i f   w e   s h o u l d   n o t i f y   ( i . e . ,   i f   3   h o u r s   h a v e   p a s s e d )� ��� i   X [��� I      ������� 0 shouldnotify shouldNotify� ���� o      ���� 0 serial_number  ��  ��  � k     2�� ��� r     ��� I    ������
�� .misccurdldt    ��� null��  ��  � o      ���� 0 currentdate currentDate� ��� r    ��� n   ��� I   	 ������� 0 objectforkey_ objectForKey_� ���� o   	 
���� 0 serial_number  ��  ��  � o    	���� .0 lastnotificationtimes lastNotificationTimes� o      ���� ,0 lastnotificationtime lastNotificationTime� ��� Z    / ����  >    o    ���� ,0 lastnotificationtime lastNotificationTime m    ��
�� 
msng Z    +���� A    " l   ���� \    	
	 o    ���� 0 currentdate currentDate
 o    ���� ,0 lastnotificationtime lastNotificationTime��  ��   l   !���� ]    ! o    ���� V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed 1     ��
�� 
hour��  ��   l  % ' L   % ' m   % &��
�� boovfals $  Less than 3 hours have passed    � <   L e s s   t h a n   3   h o u r s   h a v e   p a s s e d��  ��  ��  ��  � �� l  0 2 L   0 2 m   0 1��
�� boovtrue R L Either no notification has been sent or more than so many hours have passed    � �   E i t h e r   n o   n o t i f i c a t i o n   h a s   b e e n   s e n t   o r   m o r e   t h a n   s o   m a n y   h o u r s   h a v e   p a s s e d��  �  l     ��������  ��  ��    l     ����   9 3 Helper method to update the last notification time    � f   H e l p e r   m e t h o d   t o   u p d a t e   t h e   l a s t   n o t i f i c a t i o n   t i m e  !  i   \ _"#" I      ��$���� 80 updatelastnotificationtime updateLastNotificationTime$ %��% o      ���� 0 serial_number  ��  ��  # k     && '(' r     )*) I    ������
�� .misccurdldt    ��� null��  ��  * o      ���� 0 currentdate currentDate( +,+ l   ��������  ��  ��  , -.- l   ��/0��  / B < Set the current date as the value for the serial number key   0 �11 x   S e t   t h e   c u r r e n t   d a t e   a s   t h e   v a l u e   f o r   t h e   s e r i a l   n u m b e r   k e y. 2��2 n   343 I   	 ��5���� &0 setobject_forkey_ setObject_forKey_5 676 o   	 
���� 0 currentdate currentDate7 8��8 o   
 ���� 0 serial_number  ��  ��  4 o    	���� .0 lastnotificationtimes lastNotificationTimes��  ! 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  = J D Save notification times to a file using NSPropertyListSerialization   > �?? �   S a v e   n o t i f i c a t i o n   t i m e s   t o   a   f i l e   u s i n g   N S P r o p e r t y L i s t S e r i a l i z a t i o n< @A@ i   ` cBCB I      �������� .0 savenotificationtimes saveNotificationTimes��  ��  C k     DD EFE r     GHG n    IJI I    ��K���� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_K LML o    ���� .0 lastnotificationtimes lastNotificationTimesM NON l   P����P n   QRQ o    ���� <0 nspropertylistxmlformat_v1_0 NSPropertyListXMLFormat_v1_0R m    ��
�� misccura��  ��  O STS m    ����  T U��U l   	V����V m    	��
�� 
msng��  ��  ��  ��  J n    WXW o    ���� :0 nspropertylistserialization NSPropertyListSerializationX m     ��
�� misccuraH o      ���� 0 	plistdata 	plistDataF Y��Y r    Z[Z n   \]\ I    ��^���� 20 writetofile_atomically_ writeToFile_atomically_^ _`_ o    ���� "0 storagefilepath storageFilePath` a��a m    ��
�� boovtrue��  ��  ] o    ���� 0 	plistdata 	plistData[ o      ���� 0 	plistdata 	plistData��  A bcb l     ��������  ��  ��  c ded l     ��fg��  f N H Load notification times from the file using NSPropertyListSerialization   g �hh �   L o a d   n o t i f i c a t i o n   t i m e s   f r o m   t h e   f i l e   u s i n g   N S P r o p e r t y L i s t S e r i a l i z a t i o ne iji i   d gklk I      �������� .0 loadnotificationtimes loadNotificationTimes��  ��  l k     fmm non r     	pqp n    rsr I    ��������  0 defaultmanager defaultManager��  ��  s n    tut o    ���� 0 nsfilemanager NSFileManageru m     ��
�� misccuraq o      ���� 0 filemanager fileManagero v��v Z   
 fwx��yw l  
 z����z n  
 {|{ I    ��}���� &0 fileexistsatpath_ fileExistsAtPath_} ~��~ o    �� "0 storagefilepath storageFilePath��  ��  | o   
 �~�~ 0 filemanager fileManager��  ��  x k    Z ��� r    %��� n   #��� I    #�}��|�} 20 datawithcontentsoffile_ dataWithContentsOfFile_� ��{� o    �z�z "0 storagefilepath storageFilePath�{  �|  � n   ��� o    �y�y 0 nsdata NSData� m    �x
�x misccura� o      �w�w 0 	plistdata 	plistData� ��� r   & @��� n  & 1��� I   ) 1�v��u�v X0 *propertylistwithdata_options_format_error_ *propertyListWithData_options_format_error_� ��� o   ) *�t�t 0 	plistdata 	plistData� ��� m   * +�s�s  � ��� l  + ,��r�q� m   + ,�p
�p 
msng�r  �q  � ��o� l  , -��n�m� m   , -�l
�l 
obj �n  �m  �o  �u  � n  & )��� o   ' )�k�k :0 nspropertylistserialization NSPropertyListSerialization� m   & '�j
�j misccura� J      �� ��� o      �i�i &0 notificationtimes notificationTimes� ��h� o      �g�g 0 theerror theError�h  � ��f� Z   A Z���e�� >  A D��� o   A B�d�d &0 notificationtimes notificationTimes� m   B C�c
�c 
msng� r   G N��� n  G L��� I   H L�b�a�`�b 0 mutablecopy mutableCopy�a  �`  � o   G H�_�_ &0 notificationtimes notificationTimes� o      �^�^ .0 lastnotificationtimes lastNotificationTimes�e  � r   Q Z��� n  Q X��� I   T X�]�\�[�] 0 
dictionary  �\  �[  � n  Q T��� o   R T�Z�Z *0 nsmutabledictionary NSMutableDictionary� m   Q R�Y
�Y misccura� o      �X�X .0 lastnotificationtimes lastNotificationTimes�f  ��  y r   ] f��� n  ] d��� I   ` d�W�V�U�W 0 
dictionary  �V  �U  � n  ] `��� o   ^ `�T�T *0 nsmutabledictionary NSMutableDictionary� m   ] ^�S
�S misccura� o      �R�R .0 lastnotificationtimes lastNotificationTimes��  j ��� l     �Q�P�O�Q  �P  �O  � ��� l     �N���N  � : 4 Native AppleScript method to display a notification   � ��� h   N a t i v e   A p p l e S c r i p t   m e t h o d   t o   d i s p l a y   a   n o t i f i c a t i o n� ��� i   h k��� I      �M��L�M $0 shownotification showNotification� ��� o      �K�K 0 message  � ��J� o      �I�I 	0 title  �J  �L  � I    �H��
�H .sysonotfnull��� ��� TEXT� o     �G�G 0 message  � �F��E
�F 
appr� o    �D�D 	0 title  �E  � ��C� l     �B�A�@�B  �A  �@  �C       �?���>�=�<�����������?  � �;�:�9�8�7�6�5�4�3�2�1�0�/�.
�; 
pimr�: 0 this  �9 V0 )disablewarningbeforesomanyhourshavepassed )disableWarningBeforeSoManyHoursHavePassed�8 0 	threshold  �7 "0 storagefilepath storageFilePath
�6 .aevtoappnull  �   � ****�5 0 extractfield extractField�4 40 removenondigitcharacters removeNonDigitCharacters�3 0 removequotes removeQuotes�2 0 shouldnotify shouldNotify�1 80 updatelastnotificationtime updateLastNotificationTime�0 .0 savenotificationtimes saveNotificationTimes�/ .0 loadnotificationtimes loadNotificationTimes�. $0 shownotification showNotification� �-��- �  ����� �, �+
�, 
vers�+  � �*��)
�* 
cobj� ��   �( 
�( 
frmk�)  � �'��&
�' 
cobj� ��   �% 
�% 
frmk�&  � �$��#
�$ 
cobj� ��   �"
�" 
osax�#  
�> misccura�= �< � ��� � / U s e r s / a n d r e a / L i b r a r y / P r e f e r e n c e s / o r g . a l b e r t i 4 2 . m a g i c - w a r n i n g s . p l i s t� �! a� ����
�! .aevtoappnull  �   � ****�   �  � �� 0 line  � $� w����� �� �� ����� � �� � � � �����'��
�	���� .0 loadnotificationtimes loadNotificationTimes� 0 ioregcmd ioregCmd
� .sysoexecTEXT���     TEXT� 0 ioreg_output  
� 
cpar� 0 outputlines outputLines� 0 product_name  � 0 serial_number  � 0 battery_percent  
� 
kocl
� 
cobj
� .corecnte****       ****� 0 extractfield extractField� 40 removenondigitcharacters removeNonDigitCharacters
� 
long� 0 shouldnotify shouldNotify� *0 notificationmessage notificationMessage� &0 notificationtitle notificationTitle�
 $0 shownotification showNotification�	 80 updatelastnotificationtime updateLastNotificationTime� .0 lastnotificationtimes lastNotificationTimes� *0 removeobjectforkey_ removeObjectForKey_� .0 savenotificationtimes saveNotificationTimes� �)j+  O�E�O�j E�O��-E�O�E�O�E�O�E�O ��[��l kh  �a  )�a l+ E�Y hO�a  )�a l+ E�Y hO�a  j)�a l+ E�O)�k+ E�O�a &b   <)�k+  /a �%a %E` O�a %E` O)_ _ l+ O)�k+  Y hY 
_ !�k+ "Y h[OY�YO)j+ #� �O������ 0 extractfield extractField� ��� �  � ���  0 line  �� 0 	fieldname 	fieldName�  � ���������� 0 line  �� 0 	fieldname 	fieldName�� 
0 prefix  �� 0 
fieldvalue 
fieldValue� 
]_����������������
�� 
ctxt
�� misccura
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
leng�� 0 removequotes removeQuotes� 3�%�%E�O�[�\[Z� *��� U��,\Zi2E�O)�k+ 	E�O�� ������������� 40 removenondigitcharacters removeNonDigitCharacters�� ����� �  ���� 0 inputstring inputString��  � �������� 0 inputstring inputString�� 0 nsstring NSString�� 0 
digitsonly 
digitsOnly� 	������������������ 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 nsregularexpressionsearch NSRegularExpressionSearch�� 
0 length  �� �� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�� 
ctxt�� -b  �,�k+ E�O���b  �,j�j+ lv�+ E�O��&� ������������� 0 removequotes removeQuotes�� ����� �  ���� 0 inputstring inputString��  � �������� 0 inputstring inputString�� 0 nsstring NSString�� 0 resultstring resultString� ������������ 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� d0 0stringbyreplacingoccurrencesofstring_withstring_ 0stringByReplacingOccurrencesOfString_withString_
�� 
ctxt�� b  �,�k+ E�O���l+ E�O��&� ������������� 0 shouldnotify shouldNotify�� ����� �  ���� 0 serial_number  ��  � �������� 0 serial_number  �� 0 currentdate currentDate�� ,0 lastnotificationtime lastNotificationTime� ����������
�� .misccurdldt    ��� null�� .0 lastnotificationtimes lastNotificationTimes�� 0 objectforkey_ objectForKey_
�� 
msng
�� 
hour�� 3*j  E�O��k+ E�O�� ��b  �  fY hY hOe� ��#���������� 80 updatelastnotificationtime updateLastNotificationTime�� ����� �  ���� 0 serial_number  ��  � ������ 0 serial_number  �� 0 currentdate currentDate� ������
�� .misccurdldt    ��� null�� .0 lastnotificationtimes lastNotificationTimes�� &0 setobject_forkey_ setObject_forKey_�� *j  E�O���l+ � ��C���������� .0 savenotificationtimes saveNotificationTimes��  ��  � ���� 0 	plistdata 	plistData� ����������������
�� misccura�� :0 nspropertylistserialization NSPropertyListSerialization�� .0 lastnotificationtimes lastNotificationTimes�� <0 nspropertylistxmlformat_v1_0 NSPropertyListXMLFormat_v1_0
�� 
msng�� �� X0 *datawithpropertylist_format_options_error_ *dataWithPropertyList_format_options_error_�� 20 writetofile_atomically_ writeToFile_atomically_�� ��,���,j��+ E�O�b  el+ E�� ��l���������� .0 loadnotificationtimes loadNotificationTimes��  ��  � ���������� 0 filemanager fileManager�� 0 	plistdata 	plistData�� &0 notificationtimes notificationTimes�� 0 theerror theError� ��������������������������������
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� &0 fileexistsatpath_ fileExistsAtPath_�� 0 nsdata NSData�� 20 datawithcontentsoffile_ dataWithContentsOfFile_�� :0 nspropertylistserialization NSPropertyListSerialization
�� 
msng
�� 
obj �� �� X0 *propertylistwithdata_options_format_error_ *propertyListWithData_options_format_error_
�� 
cobj�� 0 mutablecopy mutableCopy�� .0 lastnotificationtimes lastNotificationTimes�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  �� g��,j+ E�O�b  k+  H��,b  k+ E�O��,�j���+ 
E[�k/E�Z[�l/E�ZO�� �j+ E�Y ��,j+ E�Y ��,j+ E�� ������������� $0 shownotification showNotification�� ����� �  ������ 0 message  �� 	0 title  ��  � ������ 0 message  �� 	0 title  � ����
�� 
appr
�� .sysonotfnull��� ��� TEXT�� ��l ascr  ��ޭ