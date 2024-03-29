# Dveloper: vujadeyoon
# Email: vujadeyoon@gmail.com
# Github: https://github.com/vujadeyoon
# Personal website: https://vujadeyoon.github.io
#
# Title: Dockerfile
# Description: A Dockerfile for the NVIDIA Container Toolkit for Deep Learning


FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04


LABEL maintainer="vujadeyoon"
LABEL email="vujadeyoon@gmial.com"
LABEL version="2.0"
LABEL description="Docker with NVIDIA Container Toolkit for Deep Learning"


ARG GIT_MAINTAINER="vujadeyoon"
ARG GIT_EMAIL="vujadeyoon@gmial.com"


ENV DEBIAN_FRONTEND=noninteractive
ENV GIT_MAINTAINER=${GIT_MAINTAINER}
ENV GIT_EMAIL=${GIT_EMAIL}
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


# 0. Fix a bug related to the below messages:
#     i) W: GPG error: http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64
#           InRelease: The following signatures couldn't be verified because the public key is not available:
#           NO_PUBKEY A4B469963BF863CC.
#     ii) W: The repository 'http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64
#            InRelease' is not signed.
#
#
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC


# 1. Install the essential ubuntu packages.
RUN apt-get update &&  \
    apt-get upgrade -y &&  \
    apt-get install -y --no-install-recommends \
        build-essential \
        apt-utils \
        cmake \
        curl \
        ssh \
        sudo \
        tar \
        libcurl3-dev \
        libfreetype6-dev \
        pkg-config \
        ca-certificates \
        libjpeg-dev \
        libpng-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 2. Install the useful ubuntu packages.
RUN apt-get update &&  \
    apt-get install -y \
        eog \
        nautilus \
        imagemagick \
        libreoffice \
        python3-tk \
        pv \
        dialog \
        ffmpeg \
        libgtk2.0-dev \
        python3-matplotlib \
        wget \
        tmux \
        zsh \
        locales \
        ncdu \
        htop \
        zip \
        unzip \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 3. Install git.
RUN apt-get update && \
    apt-get install -y \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN git config --global user.name "${GIT_MAINTAINER}" && \
    git config --global user.email "${GIT_EMAIL}"

# 4. Install editors.
RUN apt-get update &&  \
    apt-get install -y \
        vim \
        gedit && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "set number" | tee -a ~/.vimrc && \
    echo "set ts=8" | tee -a ~/.vimrc && \
    echo "set sw=4" | tee -a ~/.vimrc && \
    echo "set sts=4" | tee -a ~/.vimrc && \
    echo "set smartindent" | tee -a ~/.vimrc && \
    echo "set cindent" | tee -a ~/.vimrc


# 5. Install browsers.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y \
        firefox \
        google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 6. Install Youtube-dl.
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl


# 7. Install development packages.
# MeshLab
RUN wget https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-2022.02/MeshLab2022.02-linux.AppImage -O /usr/local/bin/meshlab && \
    chmod +x /usr/local/bin/meshlab
# Blender
RUN wget https://mirrors.aliyun.com/blender/release/Blender3.4/blender-3.4.1-linux-x64.tar.xz -O /home/deb_packages/blender-3.4.1-linux-x64.tar.xz && \
    tar -xvf /home/deb_packages/blender-3.4.1-linux-x64.tar.xz -C /home/deb_packages/ && \
    ln -s /home/deb_packages/blender-3.4.1-linux-x64/blender /usr/bin/blender && \
    rm -f /home/deb_packages/blender-3.4.1-linux-x64.tar.xz


# 8. Install Korean language.
RUN apt-get update &&  \
    apt-get install -y \
        fcitx \
        fcitx-hangul \
        fonts-nanum* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 9. Set the locale.
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


# 10. Install Python.
RUN apt-get update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get install -y \
        python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 11. Set Python3.8 as default
RUN ln -s /usr/bin/python3.8 /usr/bin/python


# 12. Upgarde pip and pip3
RUN pip3 install --upgrade pip && \
    python3 -m pip install --upgrade pip


# 13. Python3 packages for mathematical functions and plotting
RUN pip3 install \
    opencv-python \
    opencv-contrib-python \
    ffmpeg-python \
    Pillow \
    imageio \
    matplotlib \
    scikit-image \
    scikit-learn \
    pandas \
    openpyxl \
    plotly \
    seaborn \
    shapely \
    pyqt5 \
    pyvista \
    pyvistaqt


# 14. Python3 packages for monitoring and debugging
RUN pip3 install \
    jupyter \
    wandb \
    gpustat \
    getgpu \
    tqdm \
    ipdb \
    icecream


# 15. Other python3 packages
RUN pip3 install \
    scipy \
    Cython \
    prettyprinter \
    colorlog \
    randomcolor \
    future==0.18.2 \
    imutils \
    psutil \
    PyYAML \
    pycrypto


# 16. Install python3 packages related to the cloud and server.
RUN pip3 install \
    flask \
    Flask-RESTful \
    gevent \
    boto3 \
    kubernetes


# 17. Install python3 packages for the deep learning research.
RUN pip3 install \
    dlib \
    PyWavelets \
    pycuda>=2022.2.2 \
    tensorflow \
    torch==1.13.1 \
    torchvision==0.14.1 \
    torchaudio==0.13.1 \
    kornia==0.6.9


# 18. Make required directory.
RUN mkdir -p /home/dev/vdisk/


# 19. Enroll bash functions to ~/.bashrc.
COPY bash_enroll_func_bashrc.sh /home/dev/bash_enroll_func_bashrc.sh
RUN bash /home/dev/bash_enroll_func_bashrc.sh && \
    rm -rf /home/dev/bash_enroll_func_bashrc.sh


# 20. Update and clean the Ubuntu packages.
RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# 21. Go to the base directory.
WORKDIR /home/dev/


# 22. Run the command.
CMD [ "/bin/bash" ]
