FROM python:3.6-slim

RUN apt-get -y update && \
    apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

COPY . /src

WORKDIR /src

#RUN cd /src && \
#    git clone https://github.com/davisking/dlib.git 

#COPY ../dlib /src

RUN cd /src/dlib/ && \
    python3 setup.py install # --yes USE_AVX_INSTRUCTIONS --no DLIB_USE_CUDA

RUN cd ~ && \
    pip3 install flask face_recognition
 
RUN mkdir /root/uploads

CMD cd /src && \
    python3 face.py 

EXPOSE 10001
