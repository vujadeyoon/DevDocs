# Python


## Table of contents
1. [Notice](#notice)
2. [PYTHONPATH](#pythonpath)
3. [Path for pip3 package](#path_pip3_package)
4. [Video mode](#video_mode)
5. [Decoding a video using OpenCV-Python](#decoding_video_opencv_python)
6. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Python
- Please note that the used image is excerpted from the [Edit Portrait mode photos on iPhone](https://support.apple.com/en-au/guide/iphone/iph310a9a220/ios). 
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. PYTHONPATH <a name="pythonpath"></a>
```bash
$ export PYTHONPATH=${PYTHONPATH}:$(pwd):${path_custom}
```


## 3. Path for pip3 package <a name="path_pip3_package"></a>
```bash
$ /usr/lib/python3.*/site-packages/         # pip3 package path for distribution
$ /usr/local/lib/python3.*/site-packages/   # pip3 package path for yours
$ ${path_venv}/lib/python3.*/site-packages/ # pip3 package path for your virtual env
```


## 4. Video mode <a name="video_mode"></a>
### 1. Landscape mode
- <img src=../asset/python/fig_landscape.png width="30%"/>
- FFmpeg encoding option: -vf "transpose=1" (i.e. Landscape mode & 90 degree rotation)

### 2. Portrait mode
- <img src=../asset/python/fig_portrait.png height="30%"/>
- FFmpeg encoding option: -vf "transpose=0" (i.e. Portrait mode & No rotation)


## 5. Decoding a video using OpenCV-Python <a name="decoding_video_opencv_python"></a>
### 1. OpenCV-Python 3
- The OpenCV-Python 3 does not consider the FFmpeg encoding option (i.e. -vf "transpose=#").
- Landscape mode: <img src=../asset/python/fig_landscape.png width="30%"/>
- Portrait mode: <img src=../asset/python/fig_portrait.png height="30%"/>

### 2. OpenCV-Python 4+
- The OpenCV-Python 4+ consider the FFmpeg encoding option (i.e. -vf "transpose=#").
- Landscape mode: <img src=../asset/python/fig_portrait.png height="30%"/>
- Portrait mode: <img src=../asset/python/fig_portrait.png height="30%"/>


## 6. Reference <a name="ref"></a>
1. [Edit Portrait mode photos on iPhone](https://support.apple.com/en-au/guide/iphone/iph310a9a220/ios)
2. [Permanently add a directory to PYTHONPATH?](https://stackoverflow.com/a/3402176/18213185)
3. [Object-Oriented Programming (OOP) in Python 3](https://realpython.com/python3-object-oriented-programming/)