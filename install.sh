#################
# Fixing System #
#################

echo "\n----------Updating system----------\n"
sudo apt-get update
sudo apt-get upgrade -y


echo "\n----------Fixing Dual Boot Time----------\n"
timedatectl set-local-rtc 1



##############################################
# Adding Repositories from official websites #
##############################################

echo "\n\n----------Installing basic tools----------\n"
sudo apt-get install apt-transport-https curl net-tools

echo "\n----------Adding GPG Keys----------\n"	
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg

echo "\n----------Adding Channel----------\n"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list

echo "\n----------Updating the sources----------\n"
sudo apt-get update

echo "\n----------Installing app from sources----------\n"
sudo apt-get install sublime-text -y
sudo apt-get install brave-browser-nightly -y



#############################
# Installing Tools from apt #
#############################

echo "\n\n----------Installing basic tools----------\n"
sudo apt-get install sed git jq grep openssl vim aria2 imwheel coreutils coreutils fzf xdg-utils -y

echo "\n----------Installing programming tools----------\n"
sudo apt-get install g++ clang clangd python3 python3-pip -y

echo "\n----------Installing multimedia tools----------\n"
sudo apt-get install ffmpeg mpv sxiv gscan2pdf imagemagick pulseaudio  -y

echo "\n----------Installing fonts----------\n"
sudo apt-get install fonts-firacode fonts-font-awesome -y

echo "\n----------Installing editing & recording tools----------\n"
sudo apt-get install kdenlive obs-studio gimp audacity -y


echo "\n----------Installing system tweaking tools----------\n"
sudo apt-get install gnome-tweaks gnome-shell gnome-shell-common -y



##############################
# Installing Tools from snap #
##############################

echo "\n\n----------Installing Social Apps----------\n"
sudo snap install telegram-desktop --edge
sudo snap install discord
sudo snap install whatsapp-for-linux
sudo snap install mailspring


echo "\n----------Installing Development Apps----------\n"
sudo snap install gitkraken --classic
sudo snap install blender --classic
sudo snap install nodejs --classic



###############################
# Copying configuration files #
###############################
echo "\n\n----------Creating Backup of .config folder----------\n"
# cd ~
# tar -cvzf old_config_backup.tar .config
# cd -
echo "\n\n [+] Config. Backup Created.\n"

echo "\n----------Copying new configurations----------\n"
#cp -vr .config ~

echo "\n----------Copying Themes----------\n"
# cp -vr .theme ~

echo "\n----------Copying fonts & system extensions----------\n"
#cp -vr .local ~

echo "\n----------Copying *rc files----------\n"
#cp .bashrc .zshrc .imwheelrc .p10k.zsh .profile .vimrc ~
#cp -vr .vim ~



################################
# Installing & Copying Scripts #
################################
echo "\n\n----------Installing scripts dependencies----------\n"
sudo apt-get install jq pup dmenu xclip -y
pip install pywal

echo "\n----------Copying scripts----------\n"
#sudo cp -vr scripts/* /usr/local/bin/

echo "\n----------Giving Permission to scripts----------\n"
sudo chmod -R +x /usr/local/bin


echo "\n\n----------Removing unwanted tools----------\n"
sudo apt-get autoremove



########
# TODO #
########
echo "\n\n----------[TODO] : Copy wallpapers to '.local\share\wallheaven'----------\n"
echo "\n----------[TODO] : Install vim plugins [:PlugInstall]----------\n"
echo "\n----------[TODO] : Configure github ssh keys----------\n"
echo "\n----------[TODO] : Configure Brave browser Sync----------\n"
