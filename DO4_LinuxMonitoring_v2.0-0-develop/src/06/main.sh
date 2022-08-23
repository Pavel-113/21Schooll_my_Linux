#!/bin/bash
# echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
# wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/goaccess.gpg add -
# sudo apt update
# sudo apt install goaccess
goaccess ../04/*.log --config-file=goaccess.conf --real-time-html --daemonize
goaccess ../04/*.log -p goaccess.conf -o report.html

