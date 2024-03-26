#!/bin/bash

case "$1" in

	"-d") # defang
		sed -i 's/\./[\.]/g' $2
		sed -i 's/@/[@]/g' $2
		sed -i 's/http/hXXp/g' $2
		exit;;
		
	"-r") # restore
		sed -i 's/\[\.\]/\./g' $2
		sed -i 's/\[@\]/@/g' $2
		sed -i 's/hXXp/http/g' $2
		exit;;

	"-s") # string 
		
		echo "$2" | sed 's/\./[\.]/g' | sed 's/@/[@]/g' | sed 's/http/hXXp/g'
		exit;;
		
	"-rs") # restore string
		echo "$2" | sed 's/\[\.\]/\./g' | sed 's/\[@\]/@/g' | sed 's/hXXp/http/g'
		exit;;
		
	"-h") # help
		echo "Description: Defang IP addresses, links, and emails."
		echo "Usage:" 
		echo "	defang.sh -d|r <filepath>"
		echo "	defang.sh -s|rs <string>"
		echo "	defang.sh -h"
		echo ""
		echo "Flags:"
		echo "	-d: defang file"
		echo "	-r: restore file"
		echo "	-s: string: input string"
		echo "	-rs: restore string"
		echo "	-h: help"
		exit;; 
	
	esac
	
exit

