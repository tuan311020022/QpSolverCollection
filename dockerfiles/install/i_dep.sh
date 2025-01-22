#!/bin/sh
set -e

# Update and upgrade the system
apt-get update
apt-get upgrade -y

# Basic dependencies
basic_dep="git \
           curl \
           nano \
           vim \
           python3-pip \
           python3-catkin-tools \
           wget \
           x11-apps \
           xvfb \
           fluxbox \
           ffmpeg"

# Install basic dependencies
apt-get install -y $basic_dep

# Update and upgrade the system again
apt-get update
apt-get upgrade -y

mkdir /root/catkin_ws
cd /root/catkin_ws

curl -1sLf \
  'https://dl.cloudsmith.io/public/mc-rtc/stable/setup.deb.sh' \
  | sudo -E bash

apt install libeigen-qld-dev python-eigen-qld python3-eigen-qld -y

# Clean up
apt-get autoremove -y
apt-get clean -y
