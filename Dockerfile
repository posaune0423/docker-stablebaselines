ARG BASE_CONTAINER=python:3.6
FROM $BASE_CONTAINER

LABEL maintainer="posaune0423"

# set env
ENV USER posaune0423
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :0.0

# Ubuntu packages
RUN apt-get update \
     && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        sudo \
        less \
        jed \
        g++  \
        git  \
        curl  \
        cmake \
        zlib1g-dev \
        libjpeg-dev \
        xvfb \
        xorg-dev \
        libboost-all-dev \
        libsdl2-dev \
        dbus \
        swig \
        software-properties-common \
        vim \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*t


# install python libraries
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt


WORKDIR ${HOME}
VOLUME ${HOME}
VOLUME /tmp/.X11-unix

CMD cd ${HOME} \
    && /usr/local/bin/jupyter notebook \
    --port=8888 --ip=0.0.0.0 --allow-root 
