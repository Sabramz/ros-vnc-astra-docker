FROM ros:noetic-robot
RUN apt-get update -y && \
  apt-get install -y tigervnc-standalone-server openbox wget && \
  rm -rf /var/lib/apt/lists
ENV VNC_DESKTOP_NAME "Xtigervnc"
ENV VNC_GEOMETRY 1280x800
ENV DISPLAY ":0"
RUN mkdir -p /exo && wget https://github.com/deref/exo/releases/download/2021.11.16/exo_standalone_2021.11.16_linux_amd64.tar.gz -O- | tar xvz && mv exo /usr/local/bin && chmod +x /usr/local/bin/exo && rm -rf /exo
COPY app/ /app/
COPY root/.config/openbox/ /root/.config/openbox/

RUN sudo apt-get update
RUN sudo apt-get install -y libgflags-dev ros-noetic-image-geometry ros-noetic-camera-info-manager\
    ros-noetic-image-transport ros-noetic-image-publisher libgoogle-glog-dev libeigen3-dev
RUN sudo apt-get install -y git
RUN git clone https://github.com/libuvc/libuvc.git
WORKDIR /libuvc
RUN mkdir build
WORKDIR build
RUN sudo apt-get install -y libusb-1.0-0-dev
RUN cmake .. && make -j4
RUN sudo make install
RUN sudo ldconfig
WORKDIR /root

CMD /app/main.sh