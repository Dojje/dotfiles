#!/bin/bash

echo "This will copy any already existing dotfiles to .old-dotfiles directory"

# Copy old dotfiles to .old-dotfiles directory
mkdir ~/.old-dotfiles
mv ~/.gitconfig ~/.old-dotfiles/.gitconfig
mv ~/.bashrc ~/.old-dotfiles/.bashrc

# add symlinks
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig # for .gitconfig
ln -s ~/.dotfiles/.bashrc ~/.bashrc # for .bashrc

