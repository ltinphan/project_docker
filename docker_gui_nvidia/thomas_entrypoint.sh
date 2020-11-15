#!/bin/bash
set -e
source /opt/ros/melodic/setup.bash >> .bashrc
source /bobble_workspace/install/setup.bash >> .bashrc
#echo "export ROS_MASTER_URI=http://192.168.1.42:11311" >> .bashrc
source .bashrc
exec "$@"
