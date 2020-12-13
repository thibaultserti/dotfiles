# shellcheck shell=bash

# COLORS
export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PAGER="less -FR"
export EDITOR="vim"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Global aliases
alias vi='vim'
alias gti='git'
alias open="xdg-open"
alias cmount="mount | column -t"
alias codei="code-insiders"
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# Command hard to remember
alias mount_ram="mount -t tmpfs tmpfs /home/tibo/ram -o size=1000m"
alias loop_working="sudo modprobe v4l2loopback; ffmpeg -stream_loop -1 -re -i Modèles/loop.webm  -f v4l2 /dev/video2"
alias portainer='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Custom
alias sms='$HOME/bin/sms.sh'
alias rez='ssh -p 9999 root@185.132.74.134 -A'
alias rootme="cd ~/Programmation/Personnel/Rootme/"
alias sdia="cd ~/Programmation/Professionnel/SDIA/"
alias vpn='openvpn --config ~/Documents/Scolaire/Centrale/Rezoleo/VPN.ovpn'
alias sw='telnet towel.blinkenlights.nl'

# Specific to some packages installation
alias mcat='mdv'
alias cat='bat'
alias ping='prettyping'
alias top="sudo htop"
alias du="ncdu -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
alias xclip='xclip -select clipboard'
alias setup="tmuxinator start default"
alias logo='clear; neofetch'
alias kboff='sudo aucc -d'
alias kbon="sudo aucc -c red -b 4"

# Ubuntu/Debian specific aliases
alias agi='sudo apt install'
alias acs='apt search'
alias acsh='apt show'
alias agr='sudo apt remove'
alias agar='sudo apt autoremove'
alias aguu='sudo apt update && sudo apt upgrade'
alias agu='sudo apt upgrade'

function display-rsa() { openssl rsa -noout -text -inform PEM -in "$1" -pubin -modulusi; }
function mcd() { mkdir -p "$@" && cd "$@" || exit; }
function cls() {
  cd "$1" || exit
  ls
}
function backup() { cp "$1"{,.bak}; }
function extract() {
  if [ -f "$1" ]; then
    case $1 in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar e "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *)
      echo "'$1' cannot be extracted via extract()"
      ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
