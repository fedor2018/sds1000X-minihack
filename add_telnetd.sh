#!/bin/sh

mount -orw,remount /usr/bin/siglent
cd /usr/bin/siglent

ls sds1000b.app_ >/dev/null 2>&1

[ $? -eq 0 ] && echo ".bak exist.." && exit

mv sds1000b.app sds1000b.app_

echo "#!/bin/sh

/usr/bin/siglent/sds1000b.app_&

sleep 15
# w/o password
#telnetd -l /bin/sh &
#root:siglent_sds1000x_e
telnetd&
#
mount -o remount,rw /usr/bin/siglent
ln -s /usr/bin/siglent/usr/www  /usr/bin/siglent/config/www
mount -o remount,ro /usr/bin/siglent
/etc/init.d/lighttpd start

" >sds1000b.app
