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

# ROS dependencies
ros_dep="ros-noetic-robot-state-publisher \
         ros-noetic-urdf \
         ros-noetic-tf \
         ros-noetic-xacro \
         ros-noetic-controller-manager \
         ros-noetic-controller-manager-* \
         ros-noetic-effort-controllers \
         ros-noetic-joint-state-controller \
         ros-noetic-rviz \
         ros-noetic-geographic-msgs \
         ros-noetic-ros-controllers \
         ros-noetic-navigation \
         ros-noetic-gazebo-ros \
         ros-noetic-gazebo-ros-* \
         ros-noetic-moveit \
         ros-noetic-moveit-visual-tools \
         ros-noetic-ros-control-boilerplate \
         ros-noetic-rosbridge-server
         "

python_dep="open3d \
            numpy==1.24.4"

# Install basic dependencies
apt-get install -y $basic_dep

# Update and upgrade the system again
apt-get update
apt-get upgrade -y

# Install ROS dependencies
DEBIAN_FRONTEND=noninteractive apt-get install -y $ros_dep

pip install $python_dep

# Set the GAZEBO_MODEL_PATH
# export GAZEBO_MODEL_PATH=/root/catkin_ws/src/aist_launch/models:$GAZEBO_MODEL_PATH

mkdir /root/catkin_ws
cd /root/catkin_ws

curl -1sLf \
  'https://dl.cloudsmith.io/public/mc-rtc/stable/setup.deb.sh' \
  | sudo -E bash

apt install libeigen-qld-dev python-eigen-qld python3-eigen-qld -y

# Clean up
apt-get autoremove -y
apt-get clean -y
