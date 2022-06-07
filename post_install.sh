echo "\n---------Activating Touch Guestures------------\n"

comfortable-swipe start
comfortable-swipe autostart on
sudo comfortable-swipe start


echo "\n---------Removing Directories--------------\n"
rm -r ~/Documents
rm -r ~/Videos

echo "\n---------Creating Symbolic links--------------\n"
ln -s /mnt/ECHO/Documents ~
ln -s /mnt/ECHO/Videos ~
ln -s /mnt/ECHO/Documents/AndroidStudioProjects ~