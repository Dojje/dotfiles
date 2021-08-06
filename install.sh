#!/bin/bash

read -p 'Install Packages? [y/n]: ' instpkg

if [ $instpkg == "y" ]
then

# download pacman packages
sudo pacman -S htop \
xorg \
xorg-server \
xorg-init \
xf86-video-fbdev \
picom \
firefox \
wget \
htop \
thunar \
rofi \
dmenu \
rsync \
ttf-ubuntu-font-family \
materia-gtk-theme \
papirus-icon-theme \
lxappearance

fi

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

echo "moved dotfiles"

# add symlinks
# for .gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# for .bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# for i3 config
mkdir -p ~/.config/i3/
ln -s ~/.dotfiles/.config/i3/config ~/.config/i3/config

# for i3status
mkdir -p ~/.config/i3status/
ln -s ~/.dotfiles/.config/i3status/i3status.conf ~/.config/i3status/i3status.conf

# for rofi config
mkdir -p ~/.config/rofi
ln -s ~/.dotfiles/.config/rofi/config ~/.config/rofi/config

# for rofi theme
# it's unnecicerry to create extra folders because it's going into the same folder as rofi config
ln -s ~/.dotfiles/.config/rofi/devdeo_nord.rasi ~/.config/rofi/devdeo_nord.rasi
