#!/bin/bash

# Update and upgrade existing packages
apt update && apt upgrade -y

# Install figlet and curl
apt install -y figlet curl

# Announce universe repository addition with figlet
figlet Adding Universe Repository...

# Add the universe repository to sources.list
echo "deb http://archive.ubuntu.com/ubuntu/ jammy universe" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu/ jammy-security universe" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu/ jammy-updates universe" >> /etc/apt/sources.list

# Update the package list again
figlet Updating package list...
apt update

# Remove Ubuntu Desktop
figlet Removing Ubuntu Desktop...
apt remove -y ubuntu-desktop
apt autoremove -y

# Install GNOME Desktop
figlet Installing GNOME...
apt install -y ubuntu-gnome-desktop

# Uninstall bloatware
figlet Removing bloat...
apt remove -y branding-ubuntu thunderbird libreoffice-calc libreoffice-impress libreoffice-writer libreoffice-math firefox

# Thorough LibreOffice removal
sudo apt-get remove -y --purge libreoffice*

# Remove Firefox and Thunderbird snaps
figlet Removing Firefox and Thunderbird snaps
snap remove firefox
snap remove thunderbird
apt autoremove -y

# Install fnm (Fast Node Manager)
figlet Installing fnm...
curl -fsSL https://fnm.vercel.app/install | bash

# Install Node.js (replace with your desired version)
figlet Installing node 21.6.2...
fnm install 21.6.2

# Install Python 3.11
figlet Installing python3.11...
apt install python3.11

# Wallpapers
figlet Installing wallpapers...

# Replace with your wallpaper download URL
wallpaper_url="https://github.com/JoshAtticus/twistexBuildFiles/raw/main/twistex_wallpapers.zip"

# Create a temporary download location
mkdir -p /tmp/wallpapers
cd /tmp/wallpapers

# Download and extract 
curl -L -o wallpapers.zip $wallpaper_url 
unzip wallpapers.zip

# Replace default wallpapers (adjust paths as needed) 
sudo mv *.png /usr/share/backgrounds/

# Set aura.png as default (replace with your preferred wallpaper)
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/aura.png

# Set GNOME theme to dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 

# Remove the downloaded zip file
rm wallpapers.zip 
