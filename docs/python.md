# Python


## Table of contents
1. [Notice](#notice)
2. [Environment variables for Python3](#env_var_python3)
3. [How to remove \_\_pycache\_\_](#remove_pycache)
4. [How to convert tab to space](#tab2space)
5. [Path for pip3 package](#path_pip3_package)
6. [Video mode](#video_mode)
7. [Decoding a video using OpenCV-Python](#decoding_video_opencv_python)
8. [How to fix a bug](#fix_bug)
9. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Python
- Please note that the used image is excerpted from the [Edit Portrait mode photos on iPhone](https://support.apple.com/en-au/guide/iphone/iph310a9a220/ios). 
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Environment variables for Python3 <a name="env_var_python3"></a>
### 1. PYTHONPATH
1. How to add addtional PYTHONPATH
```bash
$ export PYTHONPATH=${PYTHONPATH}:$(pwd):${path_custom}
```
2. How to remove the latest added PYTHONPATH
```bash
$ PYTHONPATH=$(echo $PYTHONPATH | sed 's/:[^:]*$//')
```
3. How to remove redundant PYTHONPATH
```bash
$ PYTHONPATH=$(echo -n $PYTHONPATH | tr ":" "\n" | sort | uniq -c | tr -s " " | cut -d " " -f3 | tr "\n" ":")
```

### 2. PYTHONDONTWRITEBYTECODE
`PYTHONDONTWRITEBYTECODE` is an environment variable that, when set to a non-empty value (e.g. "1"), tells Python not to write .pyc or .pyo files to disk when importing modules.
```bash
$ export PYTHONDONTWRITEBYTECODE=1
```

### 3. PYTHONUNBUFFERED
`PYTHONUNBUFFERED` is another environment variable that affects the behavior of Python's standard I/O streams. When set to a non-empty value, it disables output buffering for stdout and stderr. This means that output will be written immediately to the console, rather than being buffered until a certain threshold is reached. This can be useful in situations where you want to see output in real-time, such as when running a script that takes a long time to complete.
```bash
$ export PYTHONUNBUFFERED=1
```


## 3. How to remove \_\_pycache\_\_ <a name="remove_pycache"></a>
```bash
$ find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete
```


## 4. How to convert tab to space <a name="tab2space"></a>
```bash
$ expand -t 4 ${path_py_src} > ${path_py_dst} # The number of spaces is 4.
```


## 5. Path for pip3 package <a name="path_pip3_package"></a>
```bash
$ /usr/lib/python3.*/site-packages/         # pip3 package path for distribution
$ /usr/local/lib/python3.*/site-packages/   # pip3 package path for yours
$ ${path_venv}/lib/python3.*/site-packages/ # pip3 package path for your virtual env
```


## 6. Video mode <a name="video_mode"></a>
### 1. Landscape mode
- <img src=../asset/python/fig_landscape.png width="30%"/>
- FFmpeg encoding option: -vf "transpose=1" (i.e. Landscape mode & 90 degree rotation)

### 2. Portrait mode
- <img src=../asset/python/fig_portrait.png height="30%"/>
- FFmpeg encoding option: -vf "transpose=0" (i.e. Portrait mode & No rotation)


## 7. Decoding a video using OpenCV-Python <a name="decoding_video_opencv_python"></a>
### 1. OpenCV-Python 3
- The OpenCV-Python 3 does not consider the FFmpeg encoding option (i.e. -vf "transpose=#").
- Landscape mode: <img src=../asset/python/fig_landscape.png width="30%"/>
- Portrait mode: <img src=../asset/python/fig_portrait.png height="30%"/>

### 2. OpenCV-Python 4+
- The OpenCV-Python 4+ consider the FFmpeg encoding option (i.e. -vf "transpose=#").
- Landscape mode: <img src=../asset/python/fig_portrait.png height="30%"/>
- Portrait mode: <img src=../asset/python/fig_portrait.png height="30%"/>


## 8. How to fix a bug <a name="fix_bug"></a>
### 1. Matplotlib
```bash
# Error message
UserWarning: Matplotlib is currently using agg, which is a non-GUI backend, so cannot show the figure.
```
```bash
$ sudo apt-get install python3-tk
$ pip3 install pyqt5
```

### 2. PyQt
```bash
# Error message
QObject::moveToThread: Current thread (0x1441c20) is not the object's thread (0x1b0c350).
Cannot move to target thread (0x1441c20)

qt.qpa.plugin: Could not load the Qt platform plugin "xcb" in "/DATA/venv/lib/python3.8/site-packages/cv2/qt/plugins" even though it was found.
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: xcb, eglfs, linuxfb, minimal, minimalegl, offscreen, vnc, wayland-egl, wayland, wayland-xcomposite-egl, wayland-xcomposite-glx, webgl.

Aborted (core dumped)
```
```bash
$ pip3 uninstall opencv-python && pip3 install opencv-python-headless
```


## 8. Reference <a name="ref"></a>
1. [Edit Portrait mode photos on iPhone](https://support.apple.com/en-au/guide/iphone/iph310a9a220/ios)
2. [Permanently add a directory to PYTHONPATH?](https://stackoverflow.com/a/3402176/18213185)
3. [Object-Oriented Programming (OOP) in Python 3](https://realpython.com/python3-object-oriented-programming/)
4. [How to remove duplicate dirs from $PATH?](https://superuser.com/questions/1333562/how-to-remove-duplicate-dirs-from-path/1671778#1671778)
5. [GuideToPython - 자주 하는 실수](https://python-guide-kr.readthedocs.io/ko/latest/writing/gotchas.html)
6. ["UserWarning: Matplotlib is currently using agg, which is a non-GUI backend, so cannot show the figure." when plotting figure with pyplot on Pycharm](https://stackoverflow.com/questions/56656777/userwarning-matplotlib-is-currently-using-agg-which-is-a-non-gui-backend-so)
