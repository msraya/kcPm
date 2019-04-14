# kcPm: Kicad Part Manager

This is a Kicad Part Manager based on mysql connector writed in Python Qt4. It is based on the Kicad Part Manager wrote by Mike Crash: http://mikecrash.com/index.php?name=Content&pa=showpage&pid=10 using WxWidgets. I ported the program to Qt4 because I wanted to learn Qt Programming and I needed a Part Manager to manage my lab prototypes.

Although it is under development, you can manage parts, categories, purchases, storage places, suppliers, etc.. and it even could make a full backup of the Database. In the future, you would be able to manage Kicad BOM so that it can ease prototype manufacturing.

In the "contrib" folder you can find the configuration files for NSIS and py2exe in order you can convert the program to exe file under Windows systems. Also you get the database.sql file to recreate database in the server.
