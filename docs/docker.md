# Docker


## Table of contents
1. [Notice](#notice)
2. [Dockerfile](#dockerfile)
3. [How to build a Dockerfile](#build_dockerfile)
4. [How to run a docker container](#run_docker_container)
5. [Docker commands](#docker_commands)
6. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Docker
- Please note that both HOST_1 and HOST_2 are required for running GUI applications in docker container.
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Dockerfile <a name="dockerfile"></a>
- [Dockerfile](../Dockerfile)


## 3. How to build a Dockerfile <a name="build_dockerfile"></a>
```bash
(HOST_1) $ REPO_TAG=vujade:latest
(HOST_1) $ GIT_MAINTAINER=vujadeyoon
(HOST_1) $ GIT_EMAIL=vujadeyoon@gmial.com
(HOST_1) $ sudo docker build --build-arg GIT_MAINTAINER=${GIT_MAINTAINER} --build-arg GIT_EMAIL=${GIT_EMAIL} -t ${REPO_TAG} .
(HOST_1) $ unset REPO_TAG GIT_MAINTAINER GIT_EMAIL
```


## 4. How to run a docker container <a name="run_docker_container"></a>
### 1. Run a docker container.
```bash
(HOST_1) $ REPO_TAG=vujade:latest
(HOST_1) $ VOLUME=~/Desktop/vdisk:/home/dev/vdisk
(HOST_1) $ PORT=10001:11001
(HOST_1) $ ENV=PATH_DEV=/home/dev
(HOST_1) $ sudo docker run -it --rm --privileged --runtime nvidia --volume /tmp/.X11-unix:/tmp/.X11-unix:ro --env DISPLAY=unix$DISPLAY --ipc=host --net=host --volume ${VOLUME} --publish ${PORT} --env ${ENV} ${REPO_TAG} /bin/bash
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


## 5. Docker commands <a name="docker_commands"></a>
### 1. Basic docker commands
Please refer to the [Docker with NVIDIA Container Toolkit for Deep Learning](https://vujadeyoon.github.io/blog/2022/docker_with_NVIDIA_container_toolkit_for_deep_learning/).

### 2. How to detach and attach a container
1. How to detach a container without stopping it
    ```bash
    (CONTAINER) $ ctrl+p & ctrl+q
    ```
2. How to attach a container
    ```bash
    (HOST) $ sudo docker attach ${CONTAINER_ID}
    ```

### 3. How to get current attached container name in the container itself
```bash
(CONTAINER) $ cat /etc/hostname
```

### 4. How to prune docker system
```bash
(HOST) $ sudo docker system prune
```


## 6. Reference <a name="ref"></a>
1. [Docker with NVIDIA Container Toolkit for Deep Learning](https://vujadeyoon.github.io/blog/2022/docker_with_NVIDIA_container_toolkit_for_deep_learning/)
2. [Running GUI Applications in Docker — Firefox, Nautilus File Manager.](https://medium.com/codex/running-gui-applications-in-docker-firefox-nautilus-file-manager-5424694104ec)
3. [How to install Google Chrome](https://askubuntu.com/questions/510056/how-to-install-google-chrome)
4. [[EOD] GTK-WARNING **: CANNOT OPEN DISPLAY: :0.0](https://eungbean.github.io/2018/11/19/EOD-Gtk-WARNING-cannot-open-display/)
5. [youtube-dl](http://ytdl-org.github.io/youtube-dl/index.html)
6. [How to fix X Error: BadAccess, BadDrawable, BadShmSeg while running graphical application using Docker?](https://askubuntu.com/questions/1237400/how-to-fix-x-error-badaccess-baddrawable-badshmseg-while-running-graphical-ap)
7. [docker run](https://docs.docker.com/engine/reference/commandline/run/)
8. [How to use Docker Build Args and Environment Variables](https://refine.dev/blog/docker-build-args-and-env-vars/)
9. [Passing a ENV variable for LABEL in Dockerfile](https://stackoverflow.com/questions/63017082/passing-a-env-variable-for-label-in-dockerfile)
10. [Docker build 할 때 parameter 처리 방법](https://blusky10.tistory.com/404)
11. [도커 (Docker) - 환경변수 (ENV) 전달하기](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=complusblog&logNo=220975099502)
12. [Correct way to detach from a container without stopping it](https://stackoverflow.com/questions/25267372/correct-way-to-detach-from-a-container-without-stopping-it)
13. [How can I get Docker Linux container information from within the container itself?](https://stackoverflow.com/questions/20995351/how-can-i-get-docker-linux-container-information-from-within-the-container-itsel)
