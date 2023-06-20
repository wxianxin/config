#!/bin/bash
 
WP_PATH=/home/$LOGNAME/Downloads/5k
 
LIST=(`ls -1 $WP_PATH`)
WP_COUNT=`ls -1 $WP_PATH | wc -l`
 
CURRENT_WP=$RANDOM
let "CURRENT_WP %= $WP_COUNT"
 
swaymsg output "*" bg $WP_PATH/${LIST[CURRENT_WP]} fill #000000
exit 0
