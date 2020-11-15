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

#RUN echo "source /opt/ros/melodic/setup.bash" >> /.basrc

#RUN echo "export ROS_MASTER_URI=192.168.1.42" >> /.basrc

ENV BOBBLE_WS=/bobble_workspace

RUN source /opt/ros/melodic/setup.bash && \
    mkdir -p $BOBBLE_WS/src && \
    cd $BOBBLE_WS/src && \
    catkin_init_workspace && \
    git clone https://github.com/super-owesome/bobble_controllers.git && \
    git clone https://github.com/super-owesome/bobble_description.git

RUN cd $BOBBLE_WS

RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd $BOBBLE_WS; catkin_make; catkin_make install'

RUN pip install matplotlib==2.0.2 && \
    pip install numpy && \
    pip install scipy && \
    pip install jupyter && \
    pip install seaborn && \
    pip install pandas && \
    pip install bokeh && \
    pip install rosbag_pandas
RUN rm -rf /var/lib/apt/lists/* 

EXPOSE 11345
#RUN echo "source /bobble_workspace/install/setup.bash" >> /.basrc

ADD ./thomas_entrypoint.sh /

ENTRYPOINT ["/thomas_entrypoint.sh"]

CMD ["bash"]


