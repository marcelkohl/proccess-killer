#!/bin/bash

if [ -z "$1" ]
  then
    maxlimit=99
else
  maxlimit=$1
fi

ps axo user,%cpu,pid,vsz,rss,uid,gid --sort %cpu,rss\
| awk -v max=$maxlimit '$6 != 0 && $7 != 0 && $2 > max'\
| awk '{print $3}'\
| while read line;\
    do\
      ps u --no-headers -p $line;\
      echo "$(date) - $(ps u --no-headers -p $line)" >> pkill.log;\
      notify-send 'Killing proccess!' $(ps -p $line -o command --no-headers | awk '{print $1}') -u normal -i dialog-warning -t 3000;\
      kill $line;\
  done;
