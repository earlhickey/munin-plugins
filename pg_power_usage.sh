#!/bin/sh
#
# Plugin to monitor power usager
# version: 2014-02-14
# author: pG
#
# install the plugin :
# save it in /usr/share/munin/plugins, then activate it with a symbolic link
# ln -s /usr/share/munin/plugins/power_usage /etc/munin/plugins/
#
# Magic markers (optional - only used by munin-config and some installation scripts):
#%# family=contrib
 
WARN=5000
CRIT=7500
 
echo "graph_title Power Usage"
echo "graph_args --base 1000"
echo "graph_scale no"
echo "graph_vlabel Watt"
echo "graph_category sensors"
echo "graph_info This graph shows current power usage"
echo "power.label power"
echo "power.type GAUGE"
echo "power.info Celsius."
echo "power.colour 00ff00"
echo "power.warning $WARN"
echo "power.critical $CRIT"
 
temp=$(/usr/bin/python /home/pg/read-p1.py)
echo "power.value $temp"
