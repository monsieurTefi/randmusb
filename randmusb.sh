logo(){
	clear
	echo "                     _                     _     "
	echo " _ __ __ _ _ __   __| |_ __ ___  _   _ ___| |__  "
	echo "| '__/ _\` | '_ \ / _\` | '_ \` _ \| | | / __| '_ \ "
	echo "| | | (_| | | | | (_| | | | | | | |_| \__ \ |_) |"
	echo "|_|  \__,_|_| |_|\__,_|_| |_| |_|\__,_|___/_.__/ "
	echo "                                                 "
}

logo
echo "[?] HOW MANY TRACKS?"
echo "[?] How many tracks do you want in your playlist?"
printf "[>] "
read nb_music

logo
echo "[?] WHERE FROM?"
echo "[?] Where are your music stored? (default: current folder)"
echo "[!] Type itunes for default iTunes folder"
printf "[>] "
read src

logo
echo "[?] WHERE TO?"
echo "[?] Where should we create the playlist? (default: parent folder)"
printf "[>] "
read dest

./gen-playlist.sh $nb_music $src $dest