#!/bin/bash

FILE=`date +%d%m%y%T`
ls -la /home/$USER > log.$FILE
