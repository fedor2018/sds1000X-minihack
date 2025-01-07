#!/bin/sh

mount -orw,remount /usr/bin/siglent
cd /usr/bin/siglent

ls sds1000b.app_ >/dev/null 2>&1

[ $? -eq 0 ] && echo ".bak exist.." && exit

mv sds1000b.app sds1000b.app_

echo "#!/bin/sh

/usr/bin/siglent/sds1000b.app_&

sleep 15

telnetd -l /bin/sh &
" >sds1000b.app
