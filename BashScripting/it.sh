#!/usr/local/bin/bash

declare -i var1=10
declare -i var2=5

declare -i var3=$var1+$var2
echo $var3

unset var1
unset var2
unset var3 
