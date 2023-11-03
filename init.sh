#!/bin/bash

# TODO rpmfusion?
# TODO steam? (might depend on rpmfusion)

# packages
sudo dnf remove -y fedora-chromium-config && \
sudo dnf upgrade -y && \
sudo dnf install -y \
  alacritty \
  firefox \
  fish \
  fuse-sshfs \
  git \
  gitk \
  gimp \
  tig \
  htop \
  hugo \
  jid \
  lm_sensors \
  mosh \
  mpv \
  nodejs \
  nnn \
  s-tui \
  tmux \
  unrar \
  vim \
  w3m \
  yt-dlp \
  zathura \
  zathura-plugins-all \
  zathura-fish-completion \
  sway wm \
  dunst \
  sway \
  swayidle \
  swaylock \
  waybar \
  work \
  ansible \
  asciidoctor \
  podman \
  pre-commit \
  python3-dev \
  util-linux-user \
  xrandr \
  libappindicator-gtk3

# services
sudo systemctl disable --now \
  packagekit \
  raid-check.timer && \
sudo systemctl enable --now \
  sshd

# UPS configuration
sudo dnf install -y nut && \
sudo mkdir -p /etc/nut && \
sudo cp ups.conf /etc/nut/ups.conf

# tailscale
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
sudo dnf install -y tailscale && \
sudo systemctl enable --now tailscaled && \
echo "Remember to run: sudo tailscale up"
