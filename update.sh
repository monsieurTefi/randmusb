#!/bin/sh

####################################
#
#	UPDATE.SH
#	---------
#	Updates the music.data file that contains the absolute path
#	of all the music files from <MUSICFOLDER>
#
####################################

CURRENT=`pwd`
ITUNES_MUSICFOLDER="/My Music/iTunes/iTunes Media/Music/"

case "$1" in
	'')
		echo "You must specify a source directory."
		exit
		;;
	'/')
		echo "Looks like a lot to handle... Aborting"
		exit
		;;
	'itunes') 
		MUSICFOLDER=$ITUNES_MUSICFOLDER
		;;
	*)
		if [ ! -d "$1" ]
		then
		   echo "Directory $1 doesn't exist."
		   exit
		else
			cd "$1"
			MUSICFOLDER=`pwd`
			cd $CURRENT
		fi
		;;
esac

find "$MUSICFOLDER" -name "*.mp3" -print > music.data
