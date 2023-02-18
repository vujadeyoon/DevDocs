# Citrix


## Table of contents
1. [Notice](#notice)
2. [Usage](#usage)
3. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for Citrix
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. Usage <a name="usage"></a>
### 1. How to install the Citrix
1. Download and install the Citrix Workspace App (e.g. <a href="https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html" title="Citrix Workspace app 2108 for Linux"> Citrix Workspace app 2108 for Linux</a>) for Debian Packages - Full Packages (Self-Service Support).
    ```bash
        Do want to install the app protection component? (Yes)
    ```
2. Then copy some certification files to the Citrix directory.
    ```bash
    $ sudo cp -r /etc/ssl/certs/* /opt/Citrix/ICAClient/keystore/cacerts/
    ```

### 2. How to return to the local OS (i.e. Ubuntu MATE 20.04 LTS)
```bash
Ctrl + F2
```

### 3. How to fix a bug related to the user of citrixlog
```bash
$ vi /etc/passwd
```
```bash
    # Remove out the below codes.
    citrixlog:x:1001:1001::/var/log/citrix:/bin/sh
```


## 3. Reference <a name="ref"></a>
