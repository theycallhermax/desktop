#!/bin/bash

set -ouex pipefail

# install repos
dnf install -y --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" terra-release
dnf -y copr enable sneexy/zen-browser
dnf install -y terra-release

# install cli packages
dnf install -y \
	git 

# install environment packages
dnf group install -y kde-desktop
dnf remove -y \
	dolphin \
	filelight \
	ark \
	konsole \
	kwrite \
	plasma-systemmonitor \
	kfind \
	kcharselect \
	kde-partitionmanager \
	firewall-config \
	kinfocenter \
	kdebugsettings \
	kde-gtk-config \
	plasma-discover \
	krfb \
	kjournald
dnf install -y \
	rsms-inter-fonts \
	cascadia-code-fonts cascadia-code-nf-fonts cascadia-code-pl-fonts \
	yaru-sound-theme \
	spectacle \
	gnome-boxes gnome-connections gnome-software ptyxis gnome-text-editor nautilus baobab evince evince-djvu gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts gnome-tweaks gnome-disk-utility gnome-font-viewer gnome-logs gnome-maps gnome-remote-desktop gnome-system-monitor gnome-weather loupe simple-scan snapshot vlc

# install icon theme
git clone --depth=1 https://github.com/theycallhermax/WhiteSur-icon-theme.git /tmp/WhiteSur-icon-theme
cd /tmp/WhiteSur-icon-theme
./install.sh -a
cd -
rm -rf /tmp/WhiteSur-icon-theme

# install user packages
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub \
	app.zen_browser.zen \
	dev.zed.Zed \
	io.bassi.Amberol
