#!/bin/busybox ash

. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions
useBusybox

cd /tmp/$TARGET
wget https://raw.githubusercontent.com/quatmo/piCoreAddon/main/APMenu.tgz
tar -zxf /tmp/APMenu.tgz --overwrite -C /home/tc/
pcp_write_var_to_config USER_COMMAND_2 "sleep 10;/home/tc/aplayer/aplayer.sh;/home/tc/apmenu/apmenu.sh;/home/tc/aprenderer/aprenderer.sh"

echo "Rebooting..."
sleep 3
pcp br
