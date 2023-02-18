# Bashrc


## Table of contents
1. [Notice](#notice)
2. [How to edit bashrc](#edit_bashrc)
3. [How to apply bashrc](#apply_bashrc)
4. [Useful paths for bashrc](#useful_paths)
   1. [CUDA and cuDNN paths](#path_cuda_cudnn)
   2. [JAVA path](#path_java)
5. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for bashrc
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. How to edit bashrc <a name="edit_bashrc"></a>
```bash
$ vim ~/.bashrc
```


## 3. How to apply bashrc <a name="apply_bashrc"></a>
```bash
$ source ~/.bashrc
```


## 4. Useful paths for bashrc <a name="useful_paths"></a>
### 1. CUDA and cuDNN paths <a name="path_cuda_cudnn"></a>
```bash
## CUDA and cuDNN paths.
export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```

### 2. JAVA path <a name="path_java"></a>
```bash
## JAVA
export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64
export PATH=$JAVA_HOME/bin/:$PATH
export CLASS_PATH=$JAVA_HOME/lib:$CLASS_PATH
```


## 5. Reference <a name="ref"></a>
