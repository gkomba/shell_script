#!/bin/bash

if [ ${1,,} = gkomba ]; then
	echo "welcome! you are the best one!"
elif [ ${1,,} = help ]; then
	echo "put your username!"
else
	echo "you are not registered"
fi
