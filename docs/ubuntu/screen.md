# Screen


## Table of contents
1. [Notice](#notice)
2. [How to install screen](#install_screen)
3. [Usage](#usage)
4. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Screen
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. How to install screen <a name="install_screen"></a>
```bash
$ sudo apt-get install screen
```

## 3. Usage <a name="usage"></a>
### 1. How to set screenrc
```bash
$ vi ~/.screenrc
```

### 2. Recommended configurations for screenrc
```bash
defscrollback 5000
termcapinfo xterm* ti@:te@
startup_message off
hardstatus on
hardstatus alwayslastline
hardstatus string "%{.bW}%-w%{.rW}%n*%t%{-}%+w %= %c ${USER}@%H"
bindkey -k k1 select 0
bindkey -k k2 select 1
bindkey -k k3 select 2
```

### 3. How to get session list
```bash
$ screen -ls
```

### 4. How to start a new session with given name
```bash
screen -S ${name_session}
```

### 5. How to re-attach the detached session
```bash
screen -R ${name_session}
```

### 6. How to detach a session
```bash
ctrl + a + d
```

### 7. How to quit a session
```bash
$ screen -X -S ${name_session} quit
```

## 4. Reference <a name="ref"></a>
1. [Linux>기본명령어>screen](http://www.incodom.kr/Linux/%EA%B8%B0%EB%B3%B8%EB%AA%85%EB%A0%B9%EC%96%B4/screen)
2. [[Linux] screen 명령어](https://blogbicha.tistory.com/23)
3. [Kill detached screen session [closed]](https://stackoverflow.com/a/1509764/18213185)
