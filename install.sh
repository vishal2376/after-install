#!/bin/bash

##########################
# Updating the system   #
##########################

echo -e "\n---------- Updating system ----------\n"
sudo apt-get update
sudo apt-get upgrade -y


######################################
# Adding Repositories from websites  #
######################################

echo -e "\n---------- Installing basic tools ----------\n"
sudo apt-get install apt-transport-https curl net-tools -y

echo -e "\n---------- Adding GPG Keys ----------\n"	
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null 2>&1
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg > /dev/null 2>&1
sudo add-apt-repository ppa:o2sh/onefetch -y > /dev/null 2>&1

echo -e "\n---------- Adding Repositories ----------\n"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

echo -e "\n---------- Updating the sources ----------\n"
sudo apt-get update


###################################
# Installing apps from repositories#
###################################

echo -e "\n---------- Installing apps from sources ----------\n"
sudo apt-get install sublime-text brave-browser onefetch -y


#############################
# Installing Tools from apt #
#############################

echo -e "\n---------- Installing basic tools ----------\n"
sudo apt-get install sed git jq grep openssl aria2 most imwheel coreutils fzf xdg-utils suckless-tools -y
sudo apt install libinput-tools libinih-dev libxdo-dev maim astyle adb preload breeze libssl-dev lldb pkg-config -y

echo -e "\n---------- Installing programming tools ----------\n"
sudo apt-get install g++ clang clangd python3 python3-pip -y

echo -e "\n---------- Installing multimedia tools ----------\n"
sudo apt-get install ffmpeg mpv sxiv gscan2pdf imagemagick ubuntu-restricted-extras pulseaudio obs-studio kdenlive kdeconnect -y

echo -e "\n---------- Installing fonts ----------\n"
sudo apt-get install fonts-firacode fonts-font-awesome -y

echo -e "\n---------- Installing system tweaking tools ----------\n"
sudo apt-get install gnome-tweaks chrome-gnome-shell gnome-shell-extension-manager -y

echo -e "\n---------- Installing Bash Insulter ----------\n"
sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found > /dev/null 2>&1

######################
# Installing Node JS #
######################
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt-get update
sudo apt-get install nodejs -y

###################################
# Remove Snap and install Flatpak #
###################################
git clone https://github.com/MasterGeekMX/snap-to-flatpak.git
cd snap-to-flatpak
chmod +x snap-to-flatpak.sh
./snap-to-flatpak.sh
cd -


# echo -e "\n---------- Installing Flatpak Apps ----------\n"
flatpak install flathub com.github.taiko2k.tauonmb
flatpak install flathub org.blender.Blender
flatpak install flathub io.neovim.nvim


#####################
# Installing Neovim #
#####################
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim

#####################
# Installing Swipes #
#####################

echo -e "\n---------- Installing comfortable-swipe ----------\n"
git clone https://github.com/Hikari9/comfortable-swipe.git --depth 1
cd comfortable-swipe
bash install
cd -

echo -e "\n---------- Giving Permissions --------------\n"
sudo gpasswd -a "$USER" "$(ls -l /dev/input/event* | awk '{print $4}' | head --line=1)"


########################
# Configure Oh my ZSH #
########################
echo -e "\n---------- Installing zsh shell ----------\n"
sudo apt-get install zsh -y

echo -e "\n---------- Installing oh my zsh ----------\n"
echo -e "\n\n###########################"
echo -e "# Press CTRL+D to exit zsh#"
echo -e "###########################\n\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\n\n---------- Installing powerlevel10k theme ----------\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo -e "\n\n---------- Installing zsh Plugins ----------\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode


##################
# Install NvChad #
##################
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

###############################
# Copying configuration files #
###############################

echo -e "\n---------- Copying new configurations ----------\n"
cp -vr .config ~

echo -e "\n---------- Copying fonts & system extensions ----------\n"
cp -vr .local ~

echo -e "\n---------- Copying *rc files ----------\n"
cp .bashrc .zshrc .imwheelrc .p10k.zsh .profile ~


################################
# Installing & Copying Scripts #
################################

echo -e "\n\n---------- Installing scripts dependencies ----------\n"
sudo apt-get install jq pup xclip -y
pip install yt-dlp --break-system-packages  

echo -e "\n---------- Color Scheme changer ----------\n"
pip install pywal --break-system-packages

echo -e "\n---------- Copying scripts ----------\n"
sudo cp -vr scripts/* /usr/local/bin/

echo -e "\n---------- Giving Permission to scripts ----------\n"
sudo chmod +x /usr/local/bin/*
sudo chmod +x ~/.config/sxiv/*


########################
# Optimzing & Cleaning #
########################

echo -e "\n\n---------- Removing unwanted tools ----------\n"
sudo apt-get autoremove -y


########################
#    Git SSH Config    #
########################
ssh-keygen -t ed25519 -C "vishalsingh2376@gmail.com"
ssh-add ~/.ssh/id_ed25519
echo -e "\n\nAdd this to github ssh\n"
cat ~/.ssh/id_ed25519.pub


########
# TODO #
########
echo -e "\n----------[TODO] : Change Drive Name(ECHO) & then run PostInstall Script----------"
echo -e "\n----------[TODO] : Install Autofreq from github----------"
echo -e "\n----------[TODO] : Configure Brave browser Sync----------"
echo -e "\n----------[TODO] : Import Fly Pie extension configuration----------"