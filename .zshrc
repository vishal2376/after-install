

#------------------------------------------------
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
#--------------------------------------------------


# Import the colors.
. "${HOME}/.cache/wal/colors.sh"

# Create the alias.
alias dmenu='dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -fn "PatrickHand:size=14"'

export LC_ALL=en_US.utf8
export PATH=$PATH:/usr/local/go/bin
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/opt/flutter/bin:$PATH
export PATH="$PATH:$HOME/Android/Sdk/build-tools/34.0.0"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git vi-mode zsh-autosuggestions)
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/vishal/.local/bin:$PATH"
export PAGER="most"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias wallpaper="sxiv -ot ~/.local/share/wallhaven"
alias open-project="nohup env GDK_SCALE=2 GDK_DPI_SCALE=0.5 /home/vishal/Unity/Hub/Editor/2021.3.5f1/Editor/Unity -projectPath $1 >/dev/null 2>&1 &"
alias rr='ranger'
alias vim='nvim'
td(){
  TOTAL=0
  for f in *.webm ; do ffprobe -v quiet -print_format json -show_format $f | jq -r '.format.duration';done | while read line ; do TOTAL=$(( $TOTAL+$line )); done
  printf "%.2f hours\n" "$(($TOTAL/3600))"
}

pdf(){
  eval xdg-open /mnt/ECHO/PDF/$(find /mnt/ECHO/PDF/ -type f -iname "*.pdf"| awk -F'/' '{print $5 "/" $6}'  | dmenu -p "Open PDF: " -l 15 -i | sed 's/ /\\ /g')
}

vid(){
  eval mpv $(find ~/Videos/ | dmenu -p "Watch : " -i -l 10 | sed -E 's/([^a-zA-Z0-9_/])/\\\1/g')
}

yt(){
  OUTPUT_DIR="$HOME/Videos/YT-Downloads"
  if [[ $1 == *"playlist"* ]]; then
    yt-dlp -f 'bestvideo[height<=1080]+ba' --add-chapters $1 -o "$OUTPUT_DIR/%(channel)s/%(playlist|Videos)s/%(playlist_index|)s%(playlist_index&. |)s%(title)s.%(ext)s"
  else
    yt-dlp -f 'bestvideo[height<=1080]+ba' --add-chapters $1 -o "$OUTPUT_DIR/%(channel)s/%(title)s.%(ext)s"
  fi
  # Check if yt-dlp command was successful
  if [ $? -eq 0 ]; then
      notify-send "Download Complete" "The download has finished."
  else
      notify-send "Download Failed" "There was an error during the download."
  fi
}

playlist(){
  yt-dlp -f 'bestvideo[height<=1080]+ba' --add-chapters $1 -o '~/Videos/YT-Downloads/%(playlist)s/%(playlist_index)s. %(title)s.%(ext)s'
}

song(){
  yt-dlp -f '140' --embed-thumbnail --add-metadata --extract-audio --audio-format mp3 --audio-quality 0 $1 -o '~/Music/%(playlist)s/%(title)s.%(ext)s'
}

ht(){
  history | sort -r | cut -c 8- | sort -u | dmenu -l 10 -p "Search History : " | xclip -sel c -r
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

LAST_REPO=""
cd() { 
    builtin cd "$@";
    git rev-parse 2>/dev/null;

    if [ $? -eq 0 ]; then
        if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
        onefetch
        LAST_REPO=$(basename $(git rev-parse --show-toplevel))
        fi
    fi
}

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

