#!/bin/bash

# Initialise vars

	ROM=$1
	newfile="$(basename "${ROM%.*}")"

# Get jacksum if it isn't already here

	if [ ! -e ~/.jarfiles/jacksum.jar ] ; then
		if [ -n "`alias | grep jacksum`" ] ; then
			if [ -n "`which jacksum`" ] ; then
				echo "Downloading jacksum..."
			
				mkdir ~/.jarfiles
				curl -L https://github.com/jonelo/jacksum/releases/download/v3.7.0/jacksum-3.7.0.jar --create-dirs -o ~/.jarfiles/jacksum.jar
				alias jacksum="java -jar ~/.jarfiles/jacksum.jar"
			fi
		fi
	fi

# Actually "convert" the file

	if [ -f "$1" ] ; then
		echo "writing file ${newfile}.rbu"
		rm -rf ${newfile}.rbu
		cp $1 ${newfile}.rbu
		echo -n -e "#GBT#ROM$(for i in `jacksum -a sum16 -F "#HASH{i}" -E hex ${1} | fold -w2`; do echo -n "\x$i"; done )\x00\x00\x00\x00\x00\x00" >> ${newfile}.rbu
	else
		echo "The specified file does not exist."
	fi
