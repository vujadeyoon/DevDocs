# File system


## Table of contents
1. [Notice](#notice)
2. [How to fix error from File system](#fix_error_file_system)
3. [How to change file mode recursively](#change_file_mode_recursively)
4. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for File system
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. How to fix error from File system <a name="fix_error_file_system"></a>
### 1. How to fix NTFS disk write-protect
```bash
$ sudo ntfsfix /dev/sdb1
```

### 2. How to enable a file system, exFAT
```bash
$ sudo apt-get install exfat-utils exfat-fuse
```


## 3. How to change file mode recursively <a name="change_file_mode_recursively"></a>
### 1. How to change the mode of the given current directory recursively.
    ```bash
    # Recommend mode of file: 755
    $ find ./ -type d -exec chmod -R -v 755 {} \;
    ```
### 2. How to change the mode of the given current file recursively.
    ```bash
    # Recommend mode of file: 644
    $ find ./ -type f -exec chmod -R -v 644 {} \;
    ```


## 4. Reference <a name="ref"></a>
