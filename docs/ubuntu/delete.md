# Delete


## Table of contents
1. [Notice](#notice)
2. [Kinds](#kinds)
   1. [wipe](#wipe)
   2. [srm](#srm)
   3. [shred](#shred)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for deleting directories and files securely
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Kinds <a name="kinds"></a>
### 1. wipe <a name="wipe"></a>
*wipe* is used to securely erase files from magnetic media.
1. How to install the wipe
   ```bash
   $ sudo apt-get install wipe
   ```
2. Usage
   ```bash
   # Option:
   # -r: recurse into subdirectories
   # -f: force; disable confirmation query
   # -i: informational, verbose mode
   #
   #
   $ wipe -rfi ${path_to_be_deleted}
   ```

### 2. srm <a name="srm"></a>
*srm* is used to remove  (secure_deletion toolkit)
1. How to install the wipe
   ```bash
   $ sudo apt-get install secure-delete
   ```
2. Usage
   ```bash
   # Option:
   # -r: recursive mode, deletes all subdirectories
   # -v: verbose mode
   # -z: wipes the last write with zeros instead of random data
   #
   #
   $ srm -rvz ${path_to_be_deleted}
   ```

### 3. shred <a name="shred"></a>
*shred* is used to overwrite a file to hide its contents, and optionally delete it.
1. Usage
   ```bash
   # Option:
   #   -z: adds a final overwrite with zeros to hide shredding
   #   -v: enables display of operation progress
   #   -u: truncates and removes file after overwriting
   #   -n: specifies number of times to overwrite file content (the default is 3)
   #
   #
   $ shred -zvu -n ${number} ${path_file_to_be_deleted}
   ```


## 3. Reference <a name="ref"></a>
1. [Linux에서 '파일 및 디렉터리'를 영구적이고 안전하게 삭제하는 3 가지 방법](https://ko.linux-console.net/?p=1986#gsc.tab=0)
2. [리눅스 기본 명령어 - cmp, diff, diff3, comm](http://www.incodom.kr/Linux/%EA%B8%B0%EB%B3%B8%EB%AA%85%EB%A0%B9%EC%96%B4/diff)
3. [How to Securely Delete Files in Linux](https://www.groovypost.com/howto/securely-delete-files-in-linux/)
4. [How to Securely Erase a Disk and File using the Linux shred Command](https://www.freecodecamp.org/news/securely-erasing-a-disk-and-file-using-linux-command-shred/)
5. [Tools to Securely Delete Files from Linux](https://www.geeksforgeeks.org/tools-to-securely-delete-files-from-linux/)