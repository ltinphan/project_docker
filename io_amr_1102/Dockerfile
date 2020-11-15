FROM osrf/ros:melodic-desktop-full 
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}

ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN sudo apt-get update && \
    sudo apt-get install -y apt-utils build-essential psmisc vim-gtk ros-melodic-catkin ros-melodic-joy-teleop ros-melodic-joy
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN sudo apt-get update && \
    sudo apt-get install -q -y python-catkin-tools python-pip && \
    sudo apt-get install -q -y ros-melodic-hector-gazebo-plugins

#install git lfs for dealing with large file storage 
RUN echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports-main.list
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install -q -y git-lfs
RUN git lfs install

RUN /bin/bash -c '. /opt/ros/melodic/setup.bash'

# sharing git GPG key with container
RUN apt-get update && apt-get install gnupg2 -y


ADD ./thomas_entrypoint.sh /

ENTRYPOINT ["/thomas_entrypoint.sh"]

CMD ["bash"]

