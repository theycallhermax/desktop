#!/bin/bash

set -ouex pipefail

# install repos
dnf install -y --nogpgcheck --repofrompath "terra,https://repos.fyralabs.com/terra$(rpm -E %fedora)" terra-release
dnf -y copr enable sneexy/zen-browser
dnf install -y terra-release

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
