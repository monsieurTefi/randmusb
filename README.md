Randomizr
=========

A bash script allowing you to generate and copy a random playlist of songs from your computer to your USB drive!

## 1. How to use
<pre>./script.sh NB_MUSIC SRC/ DEST/ [no-clear]</pre>

With:
* NB_MUSIC: the number of music that will be in your playlist
* SRC/: the source directory (where your music is)
* DEST/: the destination directory (where you want your music stored)
* [no-clear]: an option that lets you not clear the DEST/ directory everytime you call the script

## 2. Why use it?

I created this little program to generate random playlists on my USB drive. I am using this pen drive in my car to listen to some music on the way to work, but I didn't want to copy manually albums and songs, etc. (plus, I always tend to listen to the same artists).

## 3. Scripts and files

###update.sh
Used for updating music.data, which contains all your music library

###random.sh
The script that actually copies your music. See 1. to understand how to use it.

###music.data
Your music library, listed in a text file (isn't that sexy?)
