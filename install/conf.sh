#!/bin/bash


echo "Copying conf files in the right folders ..."
cp ../src/.bashrc             ~/.bashrc
cp ../src/.gitconfig          ~/.gitconfig
cp ../src/.bash_aliases       ~/.bash_aliases
cp ../src/.muttrc             ~/.muttrc
cp ../src/.profile            ~/.profile
cp ../src/.screenrc           ~/.screenrc
cp ../src/.tmux.conf.local    ~/.tmux.conf.locl
cp ../src/.vimrc              ~/.vimrc
cp ../src/.zshrc              ~/.zshrc

mkdir -p ~/.ssh ~/.tmuxinator ~/bin ~/.config ~/.gnupg

cp -r ../src/tmuxinator       ~
cp -r ../src/ssh              ~
cp -r ../src/gnupg            ~
cp -r ../src/config           ~
cp -r ../src/bin              ~

chmod +x ~/bin/*
