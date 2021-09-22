#!/bin/bash
sudo pacman -Syu ansible
ansible-galaxy collection install kewlfft.aur
ansible-playbook confs.yaml -K
