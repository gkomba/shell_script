#!/bin/bash

up="before"
since="funtion"
echo $up
echo $since

showuptime(){
	local up=$(uptime -p | cut -c4-)
	local since=$(uptime -s)
	cat << EOF
------
Thish machine has been up for ${up}
It has been runnig size ${since}
------
EOF
}
showuptime
echo $up
echo $since
