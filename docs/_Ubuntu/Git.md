# Git


## Table of contents
1. [Notice](#notice)
2. [Usage](#usage)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Git
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Usage <a name="usage"></a>
### 1. How to set name and email globally
```bash
$ git config --global user.name ${USER_NAME}
$ git config --global user.email ${USER_EMAIL}
```

### 2. How to change the name of default branch globally
```bash
$ git config --global init.defaultBranch ${DEFAULT_BRANCH_NAME}
```

### 3. How to change the name of default branch
```bash
$ git branch -M ${DEFAULT_BRANCH_NAME}
```

### 4. How to ignore a notice for difference of the file mode
```bash
    old mode 100755
    new mode 100644
```
```bash
$ git config core.filemode false
```

### 5. How to restore a staged file
```bash
$ git restored --staged ${STAGED_FILE_NAME}
```

### 6. How to remove a special character, ^M
```bash
$ sed -i 's/^M//g' ${PATH_FILE}
```

### 7. How to modify the latest git commit message
```bash
$ git commit --amend
```

## 3. Reference <a name="ref"></a>
1. [Uinx/Linux: ^M 개행 문자 삭제하는 방법](https://blog.gaerae.com/2016/02/remove-m-character-from-log-files.html)
2. [[git] 커밋 메세지 수정하기 (changing commit message)](https://velog.io/@mayinjanuary/git-%EC%BB%A4%EB%B0%8B-%EB%A9%94%EC%84%B8%EC%A7%80-%EC%88%98%EC%A0%95%ED%95%98%EA%B8%B0-changing-commit-message)