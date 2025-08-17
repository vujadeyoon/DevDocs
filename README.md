# Development Documents


## Table of contents
1. [Notice](#notice)
2. [Container](#container)
3. [Python](#python)
4. [Ubuntu](#ubuntu)
5. [Hardware](#hardware)
6. [Reference](#ref)
7. [Todo](#todo)


## 1. Notice <a name="notice"></a>
- A guide for Development Documents
- Please note the variable with curly brackets ${} should be assigned correctly.
- Please note that commands should be executed from the root path.
- Please note that some references are Korean references.
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Container <a name="container"></a>
### 1. Docker <a name="docker"></a>
1. [docker.md](docs/container/docker.md)
2. [docker_nvidia_container_toolkit.md](docs/container/docker_nvidia_container_toolkit.md)

### 2. Podman <a name="podman"></a>
1. [podman.md](docs/container/podman.md)

### 3. Buildah <a name="buildah"></a>
1. [buildah.md](docs/container/buildah.md)


## 3. Python <a name="python"></a>
1. [python.md](docs/python.md)


## 4. Ubuntu <a name="ubuntu"></a>
1. [ubuntu.md](docs/ubuntu.md)
   1. [aws_cli_v2.md](docs/ubuntu/aws_cli_v2.md)
   2. [bashrc.md](docs/ubuntu/bashrc.md)
   3. [citrix.md](docs/ubuntu/citrix.md)
   4. [comparison.md](docs/ubuntu/comparison.md)
   5. [compression_decompression.md](docs/ubuntu/compression_decompression.md)
   6. [delete.md](docs/ubuntu/delete.md)
   7. [download.md](docs/ubuntu/download.md)
   8. [file_systems.md](docs/ubuntu/file_systems.md)
   9. [git.md](docs/ubuntu/git.md)
   10. [regexr.md](docs/ubuntu/regexr.md)
   11. [screen.md](docs/ubuntu/screen.md)
   12. [sed.md](docs/ubuntu/sed.md)
   13. [shell.md](docs/ubuntu/shell.md)
   14. [vim.md](docs/ubuntu/vim.md)
   15. [vscode.md](docs/ubuntu/vscode.md)


## 5. Hardware <a name="hardware"></a>
1. [tplink.md](docs/hardware/tplink.md)

  
## 6. Reference <a name="ref"></a>
1. [gitignore](https://github.com/github/gitignore)


## 7. Todo
1. Fix error
   1. sudo apt-get install --reinstall python3.6-lib2to3:amd64
   2. sudo dpkg -i --force^Cverwrite /var/cache/apt/archives/python3.6-lib2to3_3.6.15-1+focal3_all.deb
2. https://blender.stackexchange.com/questions/66265/python-opencv-cv2-in-blender
3. https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim
4. vscode - ssh
5. puuty x11
6. [How to get the current terminal name?](https://unix.stackexchange.com/questions/77796/how-to-get-the-current-terminal-name): tty
7. [How to Log Off Another Users ssh Connection by Command Line in Mac OS or Linux](https://osxdaily.com/2019/04/03/log-off-ssh-user/): ps aux | grep sshd && kill -9 ${pid}
8. :set paste
9. sudo apt-get install mesa-utils && glxinfo | grep "OpenGL version" # or glxinfo | grep -i version
10. How to check if the image is exsited.
```bash
if podman images | grep "flame2baseavatar1" > /dev/null 2>&1; then
  echo "Exist."
else
  echo "No-exist."
fi
```
11. How to check if the container is exsited.
```bash
if podman ps | grep "flame2baseavatar1" >/dev/null 2>&1; then
  echo "Exist."
else
  echo "No-exist."
fi
```
12. How to get status of the container when the container is existed.
```bash
if [[ "$(podman inspect -f '{{.State.Status}}' flame2base)" = "running" ]]; then
  echo "running"
elif [[ "$(podman inspect -f '{{.State.Status}}' flame2base)" = "exited" ]]; then
  echo "exited"
else
  :
fi
```
13. Useful function
```bash
function RunContainer() {
  local repo_image=${1}
  local name_container=${2}
  #
  #
  if ! podman images | grep ${repo_image} > /dev/null 2>&1; then
    # Theie is not hte podman image.
    if [[ -f "${path_curr}/Containerfile" ]]; then
      # Theie is the Containerfile.
      podman build -t ${repo_image}:latest
      podman run -it --privileged --security-opt=label=disable --hooks-dir=/usr/share/containers/oci/hooks.d/ --volume ./vdisk/:/home/dev/vdisk/ --detach --name ${name_container} ${repo_image}:latest "/bin/bash"  && podman start ${name_container} # --restart=always
    fi
  fi
  #
  #
  if podman ps | grep ${repo_image} > /dev/null 2>&1; then
  # There is the container.
  if [[ "$(podman inspect -f '{{.State.Status}}' ${name_container})" !- "running" ]]; then
    # The status of the container is not running.
    podman start ${name_container}
  fi
fi
#
#
if podman ps | grep ${repo_image} > /dev/null 2>&1; then
  # There is the container.
  if [[ "$(podman inspect -f '{{.State.Status}}' ${name_container})" !- "running" ]]; then
    # The status of the container is running.
    podman exec -w /home/dev/FlameToBaseAvatar/ flame2base /bin/bash ./script/container/_bash_release.sh 3 ./logs/log_$(date +'%y%m%d_%H%M%S').log DEBUG 10 False True man_01 target.jpg 0
  fi
fi
}
```
14. Git 업데이트: https://somjang.tistory.com/entry/Git-Ubuntu에서-git을-최신버전으로-업그레이드-하는-방법

