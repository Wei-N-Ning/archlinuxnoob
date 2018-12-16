#!/usr/bin/env bash

enable_ssh_service() {
    # copy this note out of ARCH installation
    # because it is very important for other
    # distro/vms too

    # 1) (download openssh package)

    # ARCH: pacman -S openssh
    # debian: apt get etc...


    # 2) enable sshd

    sudo systemctl enable sshd.service

    systemctl status sshd.service
}
