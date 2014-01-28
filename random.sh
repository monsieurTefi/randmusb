#!/bin/sh

####################################
#
#	RANDOM.SH
#	---------
#	
#	Main script.
#	Creates the randomly generated playlist.
#
#	CALL:
#	./random.sh NBMUSIC SRC/ DEST/ [no-clear]
#
####################################

cpt=0
# Default values
NB_MUSIC=0
SRC="."
DEST=".."
CURRENT=`pwd`

clear
	echo "                     _                     _     "
	echo " _ __ __ _ _ __   __| |_ __ ___  _   _ ___| |__  "
	echo "| '__/ _\` | '_ \ / _\` | '_ \` _ \| | | / __| '_ \ "
	echo "| | | (_| | | | | (_| | | | | | | |_| \__ \ |_) |"
	echo "|_|  \__,_|_| |_|\__,_|_| |_| |_|\__,_|___/_.__/ \n"

echo "Getting ready to copy $1 music tracks from $2 to $3!"

# 1. Get the number of music you want to copy
case $1 in
    ''|*[!0-9]*)
		echo "$1 is not a valid number. Aborting."
		exit
		;;
    *)
		NB_MUSIC=$1;
		echo "[1] Number of music to copy: $1"
		;;
esac

# 2. SRC directory
if [ ! -d "$2" ]
then
   echo "Directory $2 doesn't exist."
   exit
else
	cd "$2"
	SRC=`pwd`
	cd $CURRENT
fi
echo "[2] Source directory is: $2"

# 3. DEST directory
if [ ! -d "$3" ]
then
   echo "Directory $3 doesn't exist."
   exit
else
	cd "$3"
	DEST=`pwd`
	cd $CURRENT
fi
echo "[3] Destination directory is: $3"

# CLEARING DESTINATION DIRECTORY FROM ALL .MP3?
case "$4" in
	'no-clear') 
		break
		;;
	*)
		cd $DEST
		rm *.mp3
		cd $CURRENT
		;;
esac

./update.sh "$SRC"

for i in `seq 1 $1`
do
	name=`head -$((${RANDOM} % \`wc -l < music.data\` + 1)) music.data | tail -1`
	# Copy the file from absolute path to destination
	rsync "$name" $DEST
	cpt=$(($cpt+1))

	clear
	echo "                     _                     _     "
	echo " _ __ __ _ _ __   __| |_ __ ___  _   _ ___| |__  "
	echo "| '__/ _\` | '_ \ / _\` | '_ \` _ \| | | / __| '_ \ "
	echo "| | | (_| | | | | (_| | | | | | | |_| \__ \ |_) |"
	echo "|_|  \__,_|_| |_|\__,_|_| |_| |_|\__,_|___/_.__/ \n"
                                                 
#	printf "["
	for (( i = 1 ; i <= $(($cpt*20/$1)); i++ ))
    do
		printf "###"
    done
#    for (( i = 1 ; i <= $((50-$cpt*20/$1)); i++ ))
#    do
#		printf "   "
#    done
#    printf "]"
    echo "\nComplete : [$(($cpt*100/$1))%]"

    echo "(?) See the music copied? Y/n"
#    if [ $cpt -eq $NB_MUSIC ]
#    then
#    	cd $DEST
#    	head -5 `ls *.mp3`
#    fi

done
