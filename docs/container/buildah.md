# Buildah


## Table of contents
1. [Notice](#notice)
2. [How to install Buildah](#install_buildah)
3. [Containerfile](#containerfile)
4. [How to build a Containerfile](#build_containerfile)
5. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Buildah
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. How to install Buildah <a name="install_buildah"></a>
### 1. How to install Buildah 
```bash
$ sudo apt-get install buildah
```


## 3. Containerfile <a name="containerfile"></a>
- [Containerfile](../../Dockerfile)


## 4. How to build a Containerfile <a name="build_containerfile"></a>
```bash
(HOST_1) $ REPO_TAG=vujade:latest
(HOST_1) $ GIT_MAINTAINER=vujadeyoon
(HOST_1) $ GIT_EMAIL=vujadeyoon@gmial.com
(HOST_1) $ buildah bud --build-arg GIT_MAINTAINER=${GIT_MAINTAINER} --build-arg GIT_EMAIL=${GIT_EMAIL} -t ${REPO_TAG} .
(HOST_1) $ unset REPO_TAG GIT_MAINTAINER GIT_EMAIL
```


## 5. Reference <a name="ref"></a>
1. [Buildah](https://buildah.io/)
2. [Buildah](https://github.com/containers/buildah)
