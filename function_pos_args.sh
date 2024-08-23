#!/bin/bash

showname(){
	if [ ${1,,} = gkomba ]; then
		echo hello $1
		return 0
	else
		return 1;
	fi
}

showname $1
if [ $? -eq 1 ]; then
	echo "unknow"
fi