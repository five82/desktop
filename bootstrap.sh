#!/usr/bin/env bash

# Requirements:
#   - A base Arch Linux install or a minimal installation using archinstall.
#	- Install the grub bootloader (or remove the grub role)
#   - Setup a non root user and add them to the wheel group.
#   - Install sudo and give the user or wheel group full sudo execute permissions.
#   - Install neovim, git, and openssh

# Run bootstrap.sh first. Then deploy with Ansible. Run both commands with your non-root user.
# ansible-playbook --ask-vault-pass site.yml

# When the playbook run is complete, reboot, login, and run postinstall.sh.

timezone="EST5EDT"

# Setup wheel sudo permissions
sudo cp roles/sudo/files/01-wheel /etc/sudoers.d/01-wheel

# Set the timezone and generate the locale since this doesn't appear to be working in archinstall.
sudo ln -sf /usr/share/zoneinfo/"${timezone}" /etc/localtime
sudo locale-gen

# Install paru
mkdir -p "${HOME}"/projects/aur
cd "${HOME}"/projects/aur
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd "${HOME}"/projects/aur/paru
makepkg -sci --noconfirm

# Install ansible, ansible-aur-git, and ansible-gpg-key-kit.
paru -S --noconfirm ansible
paru -S --skipreview --noconfirm ansible-aur-git ansible-gpg-key-git

echo "Bootstrap complete."
