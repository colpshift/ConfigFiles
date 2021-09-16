#!/bin/sh
#source https://github.com/x70b1/polybar-scripts
#source https://github.com/polybar/polybar-scripts

echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -eq 0 ]; then
  if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
      updates_arch=0
  fi

  if [ $updates_arch -gt 0 ]; then
      echo $updates_arch
  else
      echo "0"
  fi
else
  echo ""
fi

