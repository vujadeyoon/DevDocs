# Podman


## Table of contents
1. [Notice](#notice)
2. [How to install Podman](#install_podman)
3. [Containerfile](#containerfile)
4. [How to build a Containerfile](#build_containerfile)
5. [How to run a podman container](#run_podman_container)
6. [How to check the name aliases](#check_name_aliases)
7. [How to fix a bug](#fix_bug)
8. [Podman commands](#podman_commands)
9. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Podman
- Please note that Both Podman and Docker are compatible. Thus A Dockerfile is also used for a Containerfile for the Podman. However, the Podman does not require a *sudo* command unlike the Docker.
- Please note that both HOST_1 and HOST_2 are required for running GUI applications in docker container.
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. How to install Podman <a name="install_podman"></a>
### 1. How to install Podman 
```bash
# Ubuntu 20.10 or earlier
$ source /etc/os-release
$ curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get upgrade
```
```bash
$ sudo apt-get install podman
```

### 2. How to check the installed Podman version
```bash
$ podman --version
```
```bash
   podman version 3.4.2
```

### 3. How to install Nvidia Container Toolkit
```bash
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey | sudo apt-key add - && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
$ sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
$ sudo apt list --installed *nvidia*
$ sudo mkdir -p /usr/share/containers/oci/hooks.d/ && sudo vi /usr/share/containers/oci/hooks.d/oci-nvidia-hook.json
```
```json
    {
        "version": "1.0.0",
        "hook": {
            "path": "/usr/bin/nvidia-container-toolkit",
            "args": ["nvidia-container-toolkit", "prestart"],
            "env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ]
        },
        "when": {
            "always": true,
            "commands": [".*"]
        },
        "stages": ["prestart"]
    }
```
```bash
$ sudo sed -i 's/^#no-cgroups = false/no-cgroups = true/;' /etc/nvidia-container-runtime/config.toml
```

### 4. How to check the installed NVIDIA Container Toolkit for Podman
```bash
$ podman run --rm --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
```
```bash
    Mon Mar 13 14:32:59 2023       
    +-----------------------------------------------------------------------------+
    | NVIDIA-SMI 525.89.02    Driver Version: 525.89.02    CUDA Version: 12.0     |
    |-------------------------------+----------------------+----------------------+
    | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
    | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
    |                               |                      |               MIG M. |
    |===============================+======================+======================|
    |   0  NVIDIA TITAN Xp     Off  | 00000000:01:00.0  On |                  N/A |
    | 25%   39C    P5    16W / 250W |    346MiB / 12288MiB |      0%      Default |
    |                               |                      |                  N/A |
    +-------------------------------+----------------------+----------------------+
                                                                                   
    +-----------------------------------------------------------------------------+
    | Processes:                                                                  |
    |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
    |        ID   ID                                                   Usage      |
    |=============================================================================|
    +-----------------------------------------------------------------------------+
```


## 3. Containerfile <a name="containerfile"></a>
- [Containerfile](../../Dockerfile)


## 4. How to build a Containerfile <a name="build_containerfile"></a>
```bash
(HOST_1) $ REPO_TAG=vujade:latest
(HOST_1) $ GIT_MAINTAINER=vujadeyoon
(HOST_1) $ GIT_EMAIL=vujadeyoon@gmial.com
(HOST_1) $ podman build --build-arg GIT_MAINTAINER=${GIT_MAINTAINER} --build-arg GIT_EMAIL=${GIT_EMAIL} -t ${REPO_TAG} .
(HOST_1) $ unset REPO_TAG GIT_MAINTAINER GIT_EMAIL
```


## 5. How to run a podman container <a name="run_podman_container"></a>
### 1. Run a docker container.
```bash
(HOST_1) $ REPO_TAG=vujade:latest
(HOST_1) $ VOLUME=~/Desktop/vdisk2:/home/dev/vdisk
(HOST_1) $ PORT=10001:11001
(HOST_1) $ ENV=/home/dev
(HOST_1) $ podman run -it --rm --privileged --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro --env DISPLAY=unix$DISPLAY --ipc=host --net=host --volume ${VOLUME} --publish ${PORT} --env ${ENV} ${REPO_TAG} /bin/bash
(HOST_1) $ unset REPO_TAG VOLUME PORT ENV
```

### 2. How to use xhost for GUI application
#### 1. How to install xhost
```bash
(HOST_2) $ sudo apt-get install x11-xserver-utils
```
##### 2. How to activate xhost
```bash
(HOST_2) $ xhost +local:docker
```
##### 3. How to deactivate xhost
```bash
(HOST_2) $ xhost -local:docker
```


## 6. How to check the name aliases <a name="check_name_aliases"></a>
```bash
$ cat ${HOME}/.cache/containers/short-name-aliases.conf
```
```bash
    [aliases]
      "nvidia/cuda" = "docker.io/nvidia/cuda"
```


## 7. How to fix a bug <a name="fix_bug"></a>
### 1. Leaking storage when building an image
It is recommended to use [Buildah](buildah.md) instead of the podman in order to building an image, if the following storage is full.
```bash
$ du -sh ${HOME}/.local/share/containers/storage/vfs/dir
```


## 8. Podman commands <a name="podman_commands"></a>
- Podman is compatible with Docker, I recommend you should refer to the [Docker commands](./docker.md\#docker_commands).


## 9. Reference <a name="ref"></a>
1. [Podman](https://podman.io/)
2. [Podman](https://github.com/containers/podman)
3. [How to Install Podman on Ubuntu 20.04 LTS [Step by Step]](https://www.cyberithub.com/how-to-install-podman-on-ubuntu-20-04-lts-step-by-step/)
4. [NVIDIA CONTAINER TOOLKIT-Podman](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#id9)
5. [Podman vs Docker: What are the differences?](https://www.imaginarycloud.com/blog/podman-vs-docker/)
6. [흔들리는 도커(Docker)의 위상 - OCI와 CRI 중심으로 재편되는 컨테이너 생태계](https://www.samsungsds.com/kr/insights/docker.html)
7. [Podman may be leaking storage files after cleanup (rootless) #3799](https://github.com/containers/podman/issues/3799)
8. [How to Install and Use Podman on Ubuntu 18.04](https://help.clouding.io/hc/en-us/articles/360011382320-How-to-Install-and-Use-Podman-on-Ubuntu-18-04)
9. [How To Install Podman on Ubuntu 22.04|20.04|18.04](https://computingforgeeks.com/how-to-install-podman-on-ubuntu/)
10. [Cannot import name '_gi'](https://stackoverflow.com/questions/59389831/cannot-import-name-gi)