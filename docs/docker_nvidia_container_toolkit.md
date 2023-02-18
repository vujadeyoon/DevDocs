# Docker and NVIDIA-Container-Toolkit


## Table of contents
1. [Notice](#notice)
2. [Usage](#usage)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Docker and NVIDIA-Container-Toolkit
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Usage <a name="usage"></a>
### 1. How to install Docker
```bash
$ curl https://get.docker.com | sh && sudo systemctl --now enable docker
```

### 2. How to install install NVIDIA Container Toolkit
```bash
# Setup the stable repository and the GPG key.
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
  && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
  && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update

# Install nvidia-docker2 package.
$ sudo apt-get install -y nvidia-docker2

# Restart the Docker daemon to complete the installation after setting the default runtime.
$ sudo systemctl restart docker
```

### 3. How to check a base CUDA container
```bash
$ sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```
```bash
    Wed Aug 25 04:34:07 2021       
    +-----------------------------------------------------------------------------+
    | NVIDIA-SMI 460.91.03    Driver Version: 460.91.03    CUDA Version: 11.2     |
    |-------------------------------+----------------------+----------------------+
    | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
    | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
    |                               |                      |               MIG M. |
    |===============================+======================+======================|
    |   0  TITAN Xp            Off  | 00000000:01:00.0  On |                  N/A |
    | 23%   35C    P8    11W / 250W |    364MiB / 12192MiB |      0%      Default |
    |                               |                      |                  N/A |
    +-------------------------------+----------------------+----------------------+
                                                                                
    +-----------------------------------------------------------------------------+
    | Processes:                                                                  |
    |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
    |        ID   ID                                                   Usage      |
    |=============================================================================|
    +-----------------------------------------------------------------------------+
```


## 3. Reference <a name="ref"></a>
1. [NVIDIA Container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
2. [Docker-Nvidia-Container-Toolkit](https://github.com/vujadeyoon/Docker-Nvidia-Container-Toolkit)
