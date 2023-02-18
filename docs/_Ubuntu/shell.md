# Shell


## Table of contents
1. [Notice](#notice)
2. [Usage](#usage)
   1. [Basic command](#basic_command)
   2. [Syntax](#syntax)
   3. [Path](#path)
   4. [How to back up all printed logs](#backup_logs)
3. [Functions](#functions)
   1. [Git initialization](#git_init)
   2. [Display the name of the git branch](#display_git_branch)
   3. [Secret token](#secret_token)
   4. [Convert video to frames](#vid2frm)
   5. [Convert CSV to ODS](#csv2ods)
   6. [Connect AWS EC2](#ec2_connection)
   7. [Connect docker container](#docker_connection)
   8. [Connect computer with xrdp](#xrdp_connection)
   9. [Initialize Ubuntu logs](#initialize_ubuntu_logs)
   10. [Remove the given file and open it via vim](#rmvi)
   11. [Pause](#pause)
   12. [img2png](#img2png)
   13. [How to set the alias, open for a file explore](#alias_open)
4. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for shell which is written based on the bash shell.
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Usage <a name="usage"></a>
### 1. Basic command <a name="basic_command"></a>
1. Program enrollment path for general users
   ```bash
   $ /usr/bin/       # for bin that is provided from the distribution
   $ /usr/local/bin/ # for bin that you installed (or compiled) yourself
   ```
2. Environment variable
   1. How to set the environment variable
   ```bash
   # Please note that the environment variable should be in all uppercase.
   $ export "PATH_CURR=$(pwd)"
   ```
   2. How to unset the environment variable
   ```bash
   $ unset PATH_CURR
   ```
   3. How to check all environment variables
   ```bash
   $ env
   ```
3. How to fix error related to \r in a bash file
   ```bash
   $ dos2unix ${PATH_FILE}
   ```
4. How to get file or directory sizes
   ```bash
   $ du -sh ${PATH_FILE_DIRECTORY}
   ```
5. How to get the number of found items
   ```bash
   $ ls ${ls_option} | wc -l
   ```
6. How to find a specific string in the contents of a file
   ```bash
   # Option:
   #   -n: Prefix each line of output with the 1-based line number within its input file
   #   -i: Ignoring case distinctions
   #   -r: Reading all files under each directory, recursively
   #
   #
   $ grep -nir ${found_string} ${path_file}
   ```
7. How to check process
   ```bash
   # Option:
   #   -e: Print all the processes within the system
   #   -f: See more details
   #   -u: userlist
   #
   #
   $ ps -ef
   $ ps -ef | grep ${string}
   $ ps -u -p ${pid}
   ```
8. How to open a file explore
   ```bash
   $ open . # please note that you should set alias, open in the ~/.bashrc in advance.
   ```
9. How to find a file or directory from the given path
   ```bash
   $ find ${PATH} -name ${NAME}
   ```
10. How to find and delete directory recursively on Linux system
    ```bash
    $ find ${PATH} -type d -name ${NAME_DIRECTORY} -exec rm -rf "{}" \;
    ```
11. How to run a command in the background
    ```bash
    $ ${command} &
    ```
12. whereis <br/>
    whereis: A command that finds the executable file location, source location, and man page file location of a command.
    ```bash
    $ whereis ${command}
    ```
13. which <br/>
    which: A command that finds the location of a specific command.
    ```bash
    $ which ${command}
    ```
14. How to move the current directory to the previous directory
    ```bash
    $ cd -
    ```


### 2. Syntax <a name="syntax"></a>
1. Shebang for bash
```bash
#!/bin/bash
```
2. How to find a file using name
```bash
$ find ${PATH} -name ${NAME_WITH_REGEXR}
```
3. How to determine if a variable is empty
```bash
if [ -z "${variable}" ]; then
    echo "The variable is empty."
fi
```


### 3. Path <a name="path"></a>
1. Default path
```bash
path_curr=$(pwd)                       # /home/usrname/vujadeyoon/DevDocs/docs
path_parents=$(dirname "${path_curr}") # /home/usrname/vujadeyoon/DevDocs
```
2. Related path
```bash
path_src=$1                           # /home/usrname/vujadeyoon/DevDocs/docs/img_test.png
path_parents=`dirname ${path_src}`    # /home/usrname/vujadeyoon/DevDocs/docs
name_extension=`basename ${path_src}` # img_test.png
name="${name_extension%.*}"           # img_test
extension=".${name_extension##*.}"    # .png
```

### 4. How to back up all printed logs <a name="backup_logs"></a>
1. Option 1: Internal method
```bash
#!/bin/bash
#
#
path_curr=$(pwd)
path_parents=$(dirname "${path_curr}")
#
#
path_log=$1
#
#
if [ -z "${path_log}" ]; then
  echo "[Error] Please note that the parameter, path_log should be assigned."
  exit 100
fi
#
#
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>${path_log} 2>&1
#
#
# Below commands should be saved into a log file, ${path_log}.
```
2. Option 2: External method
```bash
$ bash -x ${PATH_BASH}.sh >> ${PATH_LOG}
```


## 3. Functions <a name="functions"></a>
### 1. Git initialization <a name="git_init"></a>
```bash
## Git init.
function git_init() {
    number_commit=$1
    rm -rf .git
    git init
    git add .
    git commit -m "git init: ${number_commit}"
}
```

### 2. Display the name of the git branch <a name="display_git_branch"></a>
```bash
## Display the name of the git branch.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```

### 3. Secret token <a name="secret_token"></a>
```bash
## Secret token.
function secret_token() {
    echo "Secret token: "
}
```

### 4. Convert video to frames <a name="vid2frm"></a>
```bash
## vid2frm: Video to frames.
function vid2frm() {
  case $1 in
    -h|--help)
    echo "Usage: vid2frm name_video.mp4"
    ;;
    *)
    path_file=$1
    filename_extension="${path_file##*/}" # "$(basename -- $path_file)"
    filename=${filename_extension%.*}
    extension=".${path_file##*.}"
    rm -rf ./$filename
    mkdir -p ./$filename
    ffmpeg -i $1 -start_number 0 ./$filename/frm_%08d.png
    ;;
  esac
}
```

### 5. Convert CSV to ODS <a name="csv2ods"></a>
```bash
## Convert CSV to ODS.
function csv2ods() {
    soffice --convert-to ods $1
}
```

### 6. Connect AWS EC2 <a name="ec2_connection"></a>
```bash
## Connect EC2
function ec2_connection() {
    # $1: Path for the pem file
    # $2: IP address
    ssh -i ${PAHT_PEM} ${IP_ADDRESS} -l ubuntu
}
```

### 7. Connect docker container <a name="docker_connection"></a>
```bash
## Connect docker container
function docker_connection() {
    REPO_TAG=$1
    VOLUME=${2:-~/Desktop/vdisk:/home/dev/vdisk}
    PORT=${3:-10001:11001}
    sudo docker run -it --rm --privileged --runtime nvidia --volume /tmp/.X11-unix:/tmp/.X11-unix:ro --env DISPLAY=unix$DISPLAY --ipc=host --net=host --volume $2 --publish $3 $1 /bin/bash
}
```

### 8. Connect computer with xrdp <a name="xrdp_connection"></a>
```bash
## XRDP
_xrpd() {
    is_multimonitors=$1
    ip_addr=$2
    user_name=$3
    monitor_width=$4
    monitor_height=$5

    if [ ${is_multimonitors} == "true" ]; then
        xfreerdp /u:${user_name} /v:${ip_addr}:3389 /multimon
    else
        xfreerdp /u:${user_name} /v:${ip_addr}:3389 /w:${monitor_width} /h:${monitor_height}
    fi
}


## XRDP
xrdp() {
    is_multimonitors=${1:-false}
    is_multimonitors=${is_multimonitors,,}
    ip_addr=$2
    user_name=${3:-Administrator}
    monitor_width=${4:-1920}
    monitor_height=${5:-1080}

    if [ ${is_multimonitors} != "true" ] && [ ${is_multimonitors} != "false" ]; then
        echo "Command: xrdp \${is_multimonitors} \${ip_addr} \${user_name} \${monitor_width} \${monitor_height}"
    else
        _xrpd ${is_multimonitors} ${ip_addr} ${user_name} ${monitor_width} ${monitor_height}
    fi
}
```

### 9. Initialize Ubuntu logs <a name="initialize_ubuntu_logs"></a>
```bash
## Initialize Ubuntu logs (i.e. /var/log/).
init_log() {
    sudo rm -rf /var/log/*
    sudo rm -rf /var/log/btmp && touch /var/log/btmp
    sudo rm -rf /var/log/wtmp && touch /var/log/wtmp
    sudo rm -rf /var/log/lastlog && touch /var/log/lastlog
    sudo rm -rf /var/log/auth.log && touch /var/log/auth.log
    sudo rm -rf ~/.bash_history && history -c
}
```

### 10. Remove the given file and open it via vim <a name="rmvi"></a>
```bash
## Remove the given file and open it via vim.
function rmvi() {
    rm -f $1 && vi $1
}
```

### 11. Pause <a name="pause"></a>
```bash
function pause() {
    args_message="${1:-Press any key to continue...}"
    read -p "${args_message}"
}
```

### 12. img2png <a name="img2png"></a>
```bash
function img2png() {
    path_img_src=$1
    path_base=`dirname ${path_img_src}`
    fiename_src=`basename ${path_img_src}`
    name_src="${fiename_src%.*}"
    extension_src=".${fiename_src##*.}"
    path_img_dst="${path_base}/${name_src}.png"

    if [ "${extension_src}" != ".png" ]; then
      convert "${path_img_src}" "${path_img_dst}"
    fi
}
```

### 13. How to set the alias, open for a file explore <a name="alias_open"></a>
```bash
## Open a file explore.
alias open='xdg-open '
```

## 4. Reference <a name="ref"></a>
1. [How can I fully log all bash scripts actions?](https://serverfault.com/questions/103501/how-can-i-fully-log-all-bash-scripts-actions)
2. [[Wiki] '/bin' 디렉토리와 '/usr/bin' 디렉토리의 차이는 무엇일까? ('/bin' vs '/usr/bin')](https://wookiist.dev/10)
3. [How to find and delete directory recursively on Linux or Unix-like system](https://www.cyberciti.biz/faq/how-to-find-and-delete-directory-recursively-on-linux-or-unix-like-system/)
4. [[Linux] 쉘 스크립트(Shell script) 기초](https://engineer-mole.tistory.com/200)
5. [open command to open a file in an application](https://unix.stackexchange.com/a/512206)
6. [Linux ps Command](https://www.baeldung.com/linux/ps-command)
