# Vim


## Table of contents
1. [Notice](#notice)
2. [Usage](#usage)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Vim
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Usage <a name="usage"></a>
### 1. How to set vimrc
```bash
$ vi ~/.vimrc
```

### 2. Recommended configurations for vimrc
```bash
set number
set ts=8
set sw=4
set sts=4
set smartindent
set cindent
```

### 3. Column mode
1. Enter column mode by pressing `ctrl` + `v` at the position you want to edit.
2. Select row using direction keys
3. Enter edit mode by pressing `shift` + `i` (i.e. `I`) 
4. Edit a file. Changes are reflected only in the first line.
5. Press the `ESC` twice to apply all changes to the selected vertical line.

### 4. String search
|Command        |Description                                    |
|:-------------:|:---------------------------------------------:|
|/*SEARCH_WORD* |Search the *SEARCH_WORD* in upward direction   |
|?*SEARCH_WORD* |Search the *SEARCH_WORD* in downward direction |
|n              |Move next searched word in forward direction   |
|N              |Move next searched word in backward direction  |

### 5. String replacement
|Command                   |Description                                                                                |
|:------------------------:|:-----------------------------------------------------------------------------------------:|
|:s/*WORD_SRC*/*WORD_DST*  |Replace the first *WORD_SRC* in the line where the mouse cursor is located with *WORD_DST* |
|:%s/*WORD_SRC*/*WORD_DST* |Replace all *WORD_SRC* with *WORD_DST* throughout the file                                 |


## 3. Reference <a name="ref"></a>
1. [[Linux] vim 세로줄 편집하기, 세로 i방i향 수정하기](https://chancoding.tistory.com/134)
2. [vi 문자열 찾기 및 문자열 바꾸기 총정리](https://developsd.tistory.com/122)