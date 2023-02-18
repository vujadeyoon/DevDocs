# Comparison


## Table of contents
1. [Notice](#notice)
2. [Kinds](#kinds)
   1. [diff](#diff)
   2. [comm](#comm)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for comparison
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Kinds <a name="kinds"></a>
### 1. diff <a name="diff"></a>
*diff* is used to compare files line by line.
```bash
$ diff -u ${path_file_1} ${path_file_2}
```

### 2. comm <a name="comm"></a>
*comm* is used to compare two sorted files line by line.
```bash
$ comm -3 ${path_file_1} ${path_file_2}
```


## 3. Reference <a name="ref"></a>
1. [리눅스 기본 명령어 - cmp, diff, diff3, comm](http://www.incodom.kr/Linux/%EA%B8%B0%EB%B3%B8%EB%AA%85%EB%A0%B9%EC%96%B4/diff)