echo "\n---------Activating Touch Guestures------------\n"

comfortable-swipe start
comfortable-swipe autostart on
sudo comfortable-swipe start

echo "\n---------Removing Directories--------------\n"
rm -r ~/Documents
rm -r ~/Pictures
rm -r ~/Downloads
rm -r ~/Videos

echo "\n---------Creating Symbolic links--------------\n"
ln -s /mnt/ECHO/Documents ~
ln -s /mnt/ECHO/Pictures ~
ln -s /mnt/ECHO/Downloads ~
ln -s /mnt/ECHO/Videos ~
ln -s /mnt/ECHO/Unity ~
cp -r /mnt/ECHO/wallhaven ~/.local/share

echo "\n---------Enable Minimize on click--------------\n"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "\n---------Change Wallpaper--------------\n"
change-wallpaper

echo "\n---------Adding custom shortcuts--------------\n"
./scripts/set_shortcut.py 'Terminal' 'gnome-terminal' '<Super>Return'
./scripts/set_shortcut.py 'Random Wallpaper' 'change-wallpaper' '<Super><Shift>t'
./scripts/set_shortcut.py 'Download Wallpaper' 'waldl' '<Super><Shift>w'
./scripts/set_shortcut.py 'Sublime Text 4' 'subl' '<Super><Shift>s'
./scripts/set_shortcut.py 'Shutdown' 'gnome-session-quit --power-off' '<Super>F4'
./scripts/set_shortcut.py 'Blender' 'blender' '<Super><Shift>b'
./scripts/set_shortcut.py 'Google Search' 'google' '<Super>g'
./scripts/set_shortcut.py 'Youtube Search' 'youtube' '<Super>y'
./scripts/set_shortcut.py 'Watch Videos' 'watch-videos' '<Super>v'
./scripts/set_shortcut.py 'Search on Leetcode' 'leetcode' '<Super>s'
./scripts/set_shortcut.py 'Discord' 'discord' '<Super><Shift>d'
./scripts/set_shortcut.py 'Copy Screenshot' 'screenshot' '<Super><Shift>p'
./scripts/set_shortcut.py 'Kill Application' 'xkill' '<Super>Escape'
./scripts/set_shortcut.py 'Telegram' 'telegram-desktop' '<Super><Shift>c'
./scripts/set_shortcut.py 'Enable Mouse Scroll' 'mouse-scroll 3' '<Super><Shift>F12'
./scripts/set_shortcut.py 'Disable Mouse Scroll' 'gnome-terminal -- pkill imwheel' '<Super>F12'

echo "\n---------Activating preload--------------\n"
sudo preload