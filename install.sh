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
sudo apt-get install apt-transport-https curl net-tools -y

echo "\n----------Adding GPG Keys----------\n"	
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo add-apt-repository ppa:o2sh/onefetch

echo "\n----------Adding Channel----------\n"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

echo "\n----------Updating the sources----------\n"
sudo apt-get update

echo "\n----------Installing app from sources----------\n"
sudo apt-get install sublime-text -y
sudo apt-get install brave-browser-nightly -y
sudo apt install mono-devel -y
sudo apt-get install onefetch -y

#############################
# Installing Tools from apt #
#############################

echo "\n\n----------Installing basic tools----------\n"
sudo apt-get install sed git jq grep openssl vim aria2 imwheel coreutils coreutils fzf xdg-utils suckless-tools dmenu -y

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

echo "\n----------Installing Development Apps----------\n"
sudo snap install gitkraken --classic
sudo snap install blender --classic
sudo snap install node --classic



#######################
# Configure Oh my ZSH #
#######################
echo "\n\n----------Installing zsh shell----------\n"
sudo apt-get install zsh

echo "\n\n----------Installing oh my zsh----------\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\n\n----------Installing powerlevel10k theme----------\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "\n\n----------Installing zsh Plugins----------\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode



###############################
# Copying configuration files #
###############################
echo "\n\n----------Creating Backup of .config folder----------\n"
cd ~
tar -cvzf old_config_backup.tar .config
cd -
echo "\n\n [+] Config. Backup Created.\n"

echo "\n----------Copying new configurations----------\n"
cp -vr .config ~

echo "\n----------Copying Themes----------\n"
cp -vr .theme ~

echo "\n----------Copying fonts & system extensions----------\n"
cp -vr .local ~

echo "\n----------Copying *rc files----------\n"
cp .bashrc .zshrc .imwheelrc .p10k.zsh .profile .vimrc ~
cp -vr .vim ~



################################
# Installing & Copying Scripts #
################################
echo "\n\n----------Installing scripts dependencies----------\n"
sudo apt-get install jq pup dmenu xclip -y
pip install pywal

echo "\n----------Copying scripts----------\n"
sudo cp -vr scripts/* /usr/local/bin/

echo "\n----------Giving Permission to scripts----------\n"
sudo chmod -R +x /usr/local/bin


########################
# Optimzing & Cleaning #
########################
echo "\n\n----------Installing Auto CPU Freq----------\n"
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
pip install psutil
sudo auto-cpufreq --install

echo "\n\n----------Removing unwanted tools----------\n"
sudo apt-get autoremove -y



########
# TODO #
########
echo "\n\n----------[TODO] : Copy wallpapers to '.local\share\wallheaven'----------"
echo "\n----------[TODO] : Install vim plugins [:PlugInstall]----------"
echo "\n----------[TODO] : Configure github ssh keys----------"
echo "\n----------[TODO] : Configure Brave browser Sync----------"
echo "\n----------[TODO] : Set themes, fonts , icons ,etc. using Tweak tool----------"
echo "\n----------[TODO] : Set custom shortcut keys(see 'shortcut' folder for reference)----------"
echo "\n----------[TODO] : Edit mount option[set to manually] of ECHO Drive----------"
echo "\n----------[TODO] : After mounting, create a symbolic link of documents(ln -S /mnt/<ECHO ID>/Documents ~)----------"
echo "\n----------[TODO] : Integerate CF and CC calender with system calender----------"