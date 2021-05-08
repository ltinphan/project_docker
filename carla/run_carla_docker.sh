#!/bin/bash
xhost +si:localuser:root
XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run \
  -e SDL_VIDEODRIVER=x11 \
  -e DISPLAY=$DISPLAY\
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -p 2000-2002:2000-2002 \
  -it \
  --gpus all \
  --name="carla_docker" \
  carlasim/carla:0.9.11 ./CarlaUE4.sh -opengl

