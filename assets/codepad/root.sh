#!/usr/bin/env bash

## Package upgrades
pacman -Syu --noconfirm

## User creation
useradd akerl
mkdir -p /home/akerl/.ssh
chown akerl:akerl /home/akerl
chmod 700 /home/akerl

## SSH keys
curl -o /root/.ssh/authorized_keys https://id-ed25519.pub/groups/strong.txt
curl -o /home/akerl/.ssh/authorized_keys https://id-ed25519.pub/groups/strong.txt
chown akerl:akerl /home/akerl/.ssh/authorized_keys

# Docker setup
pacman -S --noconfirm --needed docker
systemctl enable docker

# Repo setup
# TODO: Figure out token auth here
#pacman -S ruby
#gem install spaarti --no-document
#/root/.gem/ruby/2.5.0/bin/spaarti
