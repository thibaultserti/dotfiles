#!/bin/bash

echo "Copying conf files in the right folders ..."
install --mode=640 src/.bashrc ~/.bashrc
install --mode=640 src/.gitconfig ~/.gitconfig
install --mode=640 src/.bash_aliases ~/.bash_aliases
install --mode=640 src/.muttrc ~/.muttrc
install --mode=640 src/.profile ~/.profile
install --mode=640 src/.screenrc ~/.screenrc
install --mode=640 src/.tmux.conf.local ~/.tmux.conf.locl
install --mode=640 src/.vimrc ~/.vimrc
install --mode=640 src/.zshrc ~/.zshrc

mkdir -p ~/.ssh ~/.tmuxinator ~/bin ~/.config ~/.gnupg
chmod 750 ~/.ssh ~/.tmuxinator ~/bin ~/.config ~/.gnupg

install --mode=640 src/tmuxinator/* ~/.tmuxinator/
install --mode=640 src/ssh/* ~/.ssh/
install --mode=700 src/gnupg/* ~/.gnupg/
install --mode=750 src/bin/* ~/bin/
find src/config/ -type f -exec sh -c 'dir="$(cut -d"/" -f3- <<< "$1")"; install --mode=640 "$1" ~/.config/"$dir"' _ {} \;
