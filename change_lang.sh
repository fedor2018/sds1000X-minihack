#!/bin/sh -x

#ECHO=echo

mount_fs()
{
sync
mount -o sync,$1,remount /usr/bin/siglent/
sync
}

backup_xml()
{
ls *.bak >/dev/null 2>&1
[ $? -eq 0 ] && echo ".bak exist.." && exit
$ECHO mv $1_help_info.xml $1_help_info.xml.bak
$ECHO mv $1_menu_info.xml $1_menu_info.xml.bak
$ECHO mv $1_text_info.xml $1_text_info.xml.bak
}

change_xml()
{
$ECHO cp $1_help_info.xml $2_help_info.xml
$ECHO cp $1_menu_info.xml $2_menu_info.xml
$ECHO cp $1_text_info.xml $2_text_info.xml
}

mount_fs rw
cd /usr/bin/siglent/config/ui_data
backup_xml simp
change_xml english simp

