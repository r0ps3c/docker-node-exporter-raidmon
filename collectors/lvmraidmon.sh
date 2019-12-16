#!/bin/sh

# metrics are of form
# lvs_lv_health{lv=<LVNAME>} 0|1
# 1 == ok
lvs -o name,lv_health_status | ( while read line;
do
        if ! echo $line|egrep -q '^LV';
        then
                echo $line|awk '{printf "lvs_lv_health\{lv=\"%s\"\} ",$1; if($2==""){print 1}else{print 0}}'
        fi
done)
