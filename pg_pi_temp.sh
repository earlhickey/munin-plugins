#!/bin/sh
#
# Plugin to monitor raspberry pi internal Temperature
# version: 1.0
# author: pG
#
# install the plugin :
# save it in /usr/share/munin/plugins, then activate it with a symbolic link
# ln -s /usr/share/munin/plugins/pi_temp /etc/munin/plugins/
#
# Magic markers (optional - only used by munin-config and some installation scripts):
#%# family=contrib
 
VCG=/opt/vc/bin/vcgencmd
WARN=70
CRIT=75
 
if [ "$1" = "autoconf" ]; then
        if [ -x $VCG ]; then
                echo yes
                exit 0
        else
                echo no
                exit 1
        fi
elif [ "$1" = "config" ]; then
        echo "graph_title Pi Temperature"
        echo "graph_args --base 1000"
        echo "graph_vlabel Celsius"
        echo "graph_category sensors"
        echo "graph_info This graph shows Temperatur data from $LOCATION"
        echo "temp.label temp"
        echo "temp.type GAUGE"
        echo "temp.info Celsius."
        echo "temp.colour 00ff00"
        echo "temp.warning $WARN"
        echo "temp.critical $CRIT"
        exit 0
fi
 
temp=$($VCG measure_temp | cut -d'=' -f2 | cut -d"'" -f1)
echo "temp.value $temp"