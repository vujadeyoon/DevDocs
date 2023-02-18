# Sed


## Table of contents
1. [Notice](#notice)
2. [Syntax](#syntax)
3. [Example](#example)
4. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Sed
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Syntax <a name="syntax"></a>
### 1. How to enter a special character
```bash
/: \/
.: \.
```

### 2. How to replace strings for a given file
```bash
$ sed -i "s/${STR_OLD}/${STR_NEW}/g" ${PATH_FILE}
```


## 3. Example <a name="example"></a>
### 1. How to ㄱeplace all strings matching the first word
```bash
$ sed -i "s/first_word = .\+$/first_word = replaced_words/g" ${PATH_FILE}
```


## 4. Reference <a name="ref"></a>
