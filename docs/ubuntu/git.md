# git


## Table of contents
1. [Notice](#notice)
2. [git](#git)
3. [git-lfs](#git_lfs)
4. [git submodule](#git_submodule)
5. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for git and git-lfs
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. git <a name="git"></a>
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


## 3. git-lfs <a name="git_lfs"></a>
### 1. A file where git-lfs information is written
```bash
$ .gitattributes
```

### 2. How to install git-lfs
```bash
$ sudo apt install git-lfs
```

### 3. How to track files via git-lfs
```bash
$ gi lfs install
$ git rm --cached ${path_file}
$ git lfs track ${path_file}
$ git add .gitattributes
```

### 4. How to untrack files from the git-lfs
```bash
$ git lfs untrack ${path_file}
$ git rm --cached ${path_file}
$ git add ${path_file}
```


## 4. git submodule <a name="git_submodule"></a>
### 1. A file where git submodule information is written
```bash
$ .gitmodules
```

### 2. How to clone git repository with submodules
1. Option 1
   ```bash
   $ git clone --recursive ${url_git_repo}
   ```
2. Option 2
   ```bash
   $ git clone ${url_git_repo}
   $ git submodule update --init --recursive
   ```
3. Option 3
   ```bash
   $ git clone ${url_git_repo}
   $ git submodule init
   $ git submodule update
   ```

### 3. How to add a submodule
```bash
$ git submodule add ${url_git_repo_submodule}
```

### 4. How to remove a submodule
```bash
$ git submodule deinit -f ${name_submodule}
$ git rm -f ${name_submodule}
$ rm -rf .git/modules/${name_submodule}
```


## 5. Reference <a name="ref"></a>
1. [Uinx/Linux: ^M 개행 문자 삭제하는 방법](https://blog.gaerae.com/2016/02/remove-m-character-from-log-files.html)
2. [[git] 커밋 메세지 수정하기 (changing commit message)](https://velog.io/@mayinjanuary/git-%EC%BB%A4%EB%B0%8B-%EB%A9%94%EC%84%B8%EC%A7%80-%EC%88%98%EC%A0%95%ED%95%98%EA%B8%B0-changing-commit-message)
3. [[GitHub] Git LFS (Large File Storage) 사용법](https://hbase.tistory.com/221)
4. [Git LFS 사용하기](https://velog.io/@shin6949/Git-LFS-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0)
5. [[git lfs untrack] 깃, lfs 추적 해제, 원격 저장소 lfs 저장공간 확보](https://syki66.github.io/blog/2021/04/09/git-lfs-untrack.html)
6. [Working with submodules](https://github.blog/2016-02-01-working-with-submodules/)
7. [Git Submodule 삭제 방법](http://snowdeer.github.io/git/2018/08/01/how-to-remove-git-submodule/)