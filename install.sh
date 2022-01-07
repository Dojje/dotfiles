#!/bin/bash

read -p 'Install Packages? [y/n]: ' instpkg

if [ $instpkg == "y" ]
then

# Update the system
sudo pacman -Syu

# download pacman packages
sudo pacman -S htop
sudo pacman -S xorg
sudo pacman -S xorg-server
sudo pacman -S xorg-xinit
sudo pacman -S xf86-video-fbdev
sudo pacman -S picom
sudo pacman -S firefox
sudo pacman -S get
sudo pacman -S htop
sudo pacman -S thunar

sudo pacman -S rofi
sudo pacman -S dmenu

sudo pacman -S rsync
sudo pacman -S ttf-ubuntu-font-family
sudo pacman -S materia-gtk-theme
sudo pacman -S papirus-icon-theme
sudo pacman -S lxappearance
sudo pacman -S i3
sudo pacman -S i3wm
sudo pacman -S i3lock
sudo pacman -S i3status
sudo pacman -S i3blocks
sudo pacman -S reflector
sudo pacman -S terminator

fi

sudo reflector -c Sweden -a 6 --sort rate --save /etc/pacman.d/mirrorlist

echo "This will copy any already existing dotfiles to .old-dotfiles directory"


# Copy old dotfiles to .old-dotfiles directory
mkdir ~/.old-dotfiles

mv ~/.gitconfig ~/.old-dotfiles/.gitconfig

mv ~/.bashrc ~/.old-dotfiles/.bashrc

mkdir -p ~/.old-dotfiles/.config/i3
mv ~/.config/i3/config ~/.old-dotfiles/.config/i3/config

mkdir -p ~/.old-dotfiles/.config/i3status/
mv ~/.config/i3status/i3status.conf ~/.old-dotfiles/.config/i3status/i3status.conf

mkdir -p ~/.old-dotfiles/.config/rofi/
mv ~/.config/rofi/config ~/.old-dotfiles/.config/rofi/config

mkdir -p ~/.old-dotfiles/.xinitrc/
mv ~/.xinitrc ~/.old-dotfiles/.xinitrc

echo "moved dotfiles"

# add symlinks
# for .gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# for .bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

# for i3 config
mkdir -p ~/.config/i3/
ln -s ~/dotfiles/.config/i3/config ~/.config/i3/config

# for i3status
mkdir -p ~/.config/i3status/
ln -s ~/dotfiles/.config/i3status/i3status.conf ~/.config/i3status/i3status.conf

# for rofi config
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/.config/rofi/config ~/.config/rofi/config

# for rofi theme
# it's unnecicerry to create extra folders because it's going into the same folder as rofi config
ln -s ~/dotfiles/.config/rofi/devdeo_nord.rasi ~/.config/rofi/devdeo_nord.rasi

# For xinitrc
ln -s ~/dotfiles/.xinitrc ~/.xinitrc

