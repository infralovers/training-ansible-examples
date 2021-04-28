#!/bin/bash
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible-base
sudo dpkg -i --force-overwrite /var/cache/apt/archives/ansible-base_2.10.8-1ppa~focal_all.deb