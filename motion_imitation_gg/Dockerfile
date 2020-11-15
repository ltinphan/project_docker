FROM osrf/ros:melodic-desktop-full
RUN apt-get update && apt-get upgrade -y
RUN mkdir -p /opt/catkin_ws
ENV CATKIN_WS=/opt/catkin_ws
WORKDIR ${CATKIN_WS}/motion_imitation
COPY ./motion_imitation /opt/catkin_ws/motion_imitation
RUN cd /opt/catkin_ws/motion_imitation
RUN apt-get install -y python3.7-dev
RUN rm /usr/bin/python3
RUN ln -s python3.7 /usr/bin/python3
RUN apt-get install -y python3-setuptools python-setuptools python3-pip python-pip
RUN python3 setup.py install --user
RUN apt-get install libopenmpi-dev
RUN pip3 install scikit-build  && pip3 install make
RUN pip3 install -r requirements.txt

