#!/bin/bash

echo THIS NUMBERS ARE EQUAL?
echo LETS SEE

echo Insert the first number:
read FIRST

echo Insert the second number:
read SECOND

echo The numbers are $FIRST $SECOND

if [ $FIRST -eq $SECOND ]; then
	echo "The numbesr are equals!"
else
	echo "The numbers are not equals!"
fi
