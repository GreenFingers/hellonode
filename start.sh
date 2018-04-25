#!/bin/bash
pm2 describe backend > /dev/null
RUNNING=$?

if [ "${RUNNING}" -ne 0 ]; then
  pm2 start /home/ec2-user/www/main.js -i 0 --name backend
else
  pm2 reload backend
fi;
