RANDMUSB
=========

A bash script allowing you to generate and copy a random playlist of songs from your computer to your USB drive!

## 1. What is it?

I created this little program to generate random playlists on my USB drive.
I am using this pen drive in my car to listen to some music on the way to work, but I didn't want to copy manually albums and songs, etc. (plus, I always tend to listen to the same artists).
With this, you can simply create a random playlist and store it wherever (in my case, it's my pen drive!)

## 2. How to use
### 2.1 The easy way
Via the terminal, go to the folder when the scripts are. Simply run the command line below and follow the instructions. It's that simple.
<pre>sh randmusb.sh</pre>
<i>If you notice any unexpected error, please tell me!</i>

### 2.2 The "I know what I'm doing" way
You know how to use scripts or you're in a hurry? Just type the command line below and replace the attributes in capital letters by what they mean.
<pre>./gen-playlist.sh NB_MUSIC SRC/ DEST/ [no-clear]</pre>
* NB_MUSIC: the number of music that will be in your playlist
* SRC/: the source directory (where your music is)
* DEST/: the destination directory (where you want your music stored)
* [no-clear]: an option that lets you not clear the DEST/ directory everytime you call the script

## 3. Screenshots

<img src="http://playground.laurent-fite.fr/randmusb/title.png" alt="title-screen"/>
<img src="http://playground.laurent-fite.fr/randmusb/copying-1.png" alt="copying"/>
<img src="http://playground.laurent-fite.fr/randmusb/copying-2.png" alt="still-copying"/>
<img src="http://playground.laurent-fite.fr/randmusb/done.png" alt="done"/>
<img src="http://playground.laurent-fite.fr/randmusb/list.png" alt="list-display"/>
<a href="#randmusb">Back to top</a>
