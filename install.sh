#!/bin/bash

# Update the system
sudo pacman -Syu

read -p 'Install Packages? [y/n]: ' instpkg

if [ $instpkg == "y" ]
then

# download pacman packages
sudo pacman -S htop \
xorg \
xorg-server \
xorg-xinit \
xf86-video-fbdev \
picom \
firefox \
get \
htop \
thunar \
rofi \
dmenu \
rsync \
ttf-ubuntu-font-family \
materia-gtk-theme \
papirus-icon-theme \
lxappearance \
i3-wm \
i3lock \
i3status \
i3blocks \
reflector \
terminator \
urxvt-unicode \

cd ~

# install yum 
git clone https://aur.archlinux.org/yum.git ~/
cd yum
makepkg -sri

fi
# it cannot use relector before installing relector
echo "updating mirrorlist"
sudo reflector -c Sweden -a 6 --sort rate --save /etc/pacman.d/mirrorlist
echo "updating again"
sudo pacman -Syu

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
ln -s ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi

# For xinitrc
ln -s ~/dotfiles/.xinitrc ~/.xinitrc

# For i3lock-color
mkdir -p ~/.config/i3lock-color
ln -s ~/dotfiles/.config/i3lock-color/lock.sh ~/.config/i3lock-color/lock.sh
sudo chmod +x ~/dotfiles/.config/i3lock-color/lock.sh

# For background 
ln -s ~/dotfiles/.config/i3/background.jpg ~/.config/i3/background.jpg

# For .Xresources
ln -s ~/dotfiles/.Xresources ~/.Xresources
xrdb ~/.Xresources 
