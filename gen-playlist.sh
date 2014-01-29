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

logo(){
	clear
	echo "                     _                     _     "
	echo " _ __ __ _ _ __   __| |_ __ ___  _   _ ___| |__  "
	echo "| '__/ _\` | '_ \ / _\` | '_ \` _ \| | | / __| '_ \ "
	echo "| | | (_| | | | | (_| | | | | | | |_| \__ \ |_) |"
	echo "|_|  \__,_|_| |_|\__,_|_| |_| |_|\__,_|___/_.__/ "
	echo "                                                 "
}

cpt=0
# Default values
NB_MUSIC=0
SRC="."
DEST=".."
CURRENT=`pwd`

logo

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
# If the given src dir isn't '' (if not, default is .)
if [ "$2" == "itunes" ]
then
	SRC="itunes"
else
	if [ "$2" != '' ]
	then
		echo "SRC $2"
		# check if it's a folder
		if [ ! -d "$2" ]
		then
	   		echo "Source directory $2 doesn't exist."
	   		exit
		else
			cd "$2"
			SRC=`pwd`
			cd $CURRENT
		fi
	else
		SRC="."
	fi
fi

echo "[2] Source directory is: $SRC"

# 3. DEST directory

	if [ "$3" != '' ]
	then
		# check if it's a folder
		if [ ! -d "$3" ]
		then
	   		echo "Source directory $3 doesn't exist."
	   		exit
		else
			cd "$3"
			DEST=`pwd`
			cd $CURRENT
		fi
	else
		DEST=".."
	fi

echo "[3] Destination directory is: $DEST"

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

for i in `seq 1 $NB_MUSIC`
do
	name=`head -$((${RANDOM} % \`wc -l < music.data\` + 1)) music.data | tail -1`
	# Copy the file from absolute path to destination
	rsync "$name" $DEST
	cpt=$(($cpt+1))

	logo
                                                 
#	printf "["
	for (( i = 1 ; i <= $(($cpt*20/NB_MUSIC)); i++ ))
    do
		printf "###"
    done
#    for (( i = 1 ; i <= $((50-$cpt*20/$1)); i++ ))
#    do
#		printf "   "
#    done
#    printf "]"
	echo "\nFrom: $SRC"
	echo "To: $DEST"
	FNAME=`basename "$name"`
	echo "File ($cpt/$NB_MUSIC): $FNAME"
	for (( i = 1 ; i <= $(($cpt*20/$1)); i++ ))
    do
		printf "###"
    done
    echo "\nComplete : [$(($cpt*100/$1))%]"

done

    echo "[?] See the copied music? Y/n"
    printf "[>] "
    read ANS
    if [[ "$ANS" = 'Y' || "$ANS" = 'y' || "$ANS" = "yes" ]]
    then
    	logo
    	echo "Your randmusb playlist (in $DEST):"
    	echo "----------------------"
    	ls $DEST
    	echo ""
    fi
