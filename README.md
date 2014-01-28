Randomizr
=========

A bash script allowing you to generate and copy a random playlist of songs from your computer to your USB drive!

## Use
./script.sh NB_MUSIC SRC/ DEST/ [no-clear]

With:
* NB_MUSIC: the number of music that will be in your playlist
* SRC/: the source directory (where your music is)
* DEST/: the destination directory (where you want your music stored)
* [no-clear]: an option that lets you not clear the DEST/ directory everytime you call the script

## Scripts

update.sh
---------
Used for updating music.data, which contains all your music library

random.sh
---------
The script that actually copies 