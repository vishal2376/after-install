echo "\n---------Activating Touch Guestures------------\n"

comfortable-swipe start
comfortable-swipe autostart on
sudo comfortable-swipe start

echo "\n---------Removing Directories--------------\n"
change-wallpaper

echo "\n---------Removing Directories--------------\n"
rm -r ~/Documents
rm -r ~/Pictures
rm -r ~/Downloads
rm -r ~/Music
rm -r ~/Videos

echo "\n---------Creating Symbolic links--------------\n"
ln -s /mnt/ECHO/Documents ~
ln -s /mnt/ECHO/Pictures ~
ln -s /mnt/ECHO/Downloads ~
ln -s /mnt/ECHO/Music ~
ln -s /mnt/ECHO/Videos ~
ln -s /mnt/ECHO/Unity ~
cp /mnt/ECHO/wallhaven ~/.local/share

echo "\n---------Adding custom shortcuts--------------\n"
./scripts/set_shortcut.py 'Terminal' 'gnome-terminal' '<Super>Return'
./scripts/set_shortcut.py 'Random Wallpaper' 'change-wallpaper' '<Super><Shift>t'
./scripts/set_shortcut.py 'Download Wallpaper' 'waldl' '<Super><Shift>w'
./scripts/set_shortcut.py 'Sublime Text 4' 'subl' '<Super><Shift>s'
./scripts/set_shortcut.py 'Shutdown' 'gnome-session-quit --power-off' '<Super>F4'
./scripts/set_shortcut.py 'Blender' 'blender' '<Super><Shift>b'
./scripts/set_shortcut.py 'Google' 'google' '<Super><Shift>g'
./scripts/set_shortcut.py 'Discord' 'discord' '<Super><Shift>d'
./scripts/set_shortcut.py 'Kill Application' 'xkill' '<Super>Escape'
./scripts/set_shortcut.py 'Telegram' 'telegram-desktop' '<Super><Shift>c'
./scripts/set_shortcut.py 'Enable Mouse Scroll' 'mouse-scroll 3' '<Super><Shift>F12'
./scripts/set_shortcut.py 'Disable Mouse Scroll' 'gnome-terminal -- pkill imwheel' '<Super>F12'

echo "\n---------Activating tlp--------------\n"
sudo systemctl enable tlp.service
sudo tlp start