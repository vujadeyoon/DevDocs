# Compression and decompression


## Table of contents
1. [Notice](#notice)
2. [Kinds](#kinds)
   1. [tar](#tar)
   2. [tar.gz](#tar_gz)
   3. [zip](#zip)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for compression
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Kinds <a name="kinds"></a>
### 1. tar <a name="tar"></a>
1. Compression
```bash
$ tar -cvf ${path_tar.tar} ${path_to_be_compressed}
```
2. Decompression
```bash
# Option:
#   -C: Decompressing to a specified location
#
#
# Notice:
#   Please note that the directory, ${path_to_be_decompressed} should be created in advance before decompressing.
#
#
$ tar -xvf ${path_tar.tar} -C ${path_to_be_decompressed}
```

### 2. tar.gz <a name="tar_gz"></a>
1. Compression
```bash
$ tar -czvf ${path_tar_gz.tar.gz} ${path_to_be_compressed}
```
2. Decompression
```bash
# Option:
#   -C: Decompressing to a specified location
#
#
# Notice:
#   Please note that the directory, ${path_to_be_decompressed} should be created in advance before decompressing.
#
#
$ tar -xzvf ${path_tar_gz.tar.gz} -C ${path_to_be_decompressed}
```

### 3. zip <a name="zip"></a>
1. Compression
```bash
# Option:
#   -r: Compressing a zip file including subdirectories
#   -e: Setting password on zip file
#   -P: Compressing a zip file by entering a password
#
#
$ zip -re ${path_zip.zip} ${path_to_be_compressed}
```
2. Decompression
```bash
# Option:
#   -d: Decompressing to a specified location
#
#
$ unzip ${path_zip.zip} -d ${path_to_be_decompressed}
```


## 3. Reference <a name="ref"></a>
1. [[Linux] 리눅스 (tar, gz, zip) 압축 및 압축 해제 방법](https://coding-factory.tistory.com/805)