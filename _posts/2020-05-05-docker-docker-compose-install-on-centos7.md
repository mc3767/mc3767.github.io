---
layout: post
title: "docker, docker-compose 설치"
description: "docker, docker-compose 설치 과정을 정리해 봄"
modified: 2020-05-05
tags: [docker, docker-compose]
---

### 1. 잘못 설치된 버전이 있으면 삭제

```
   $ yum remove docker \
       docker-common \
       docker-selinux \
       docker-engine
```

### 2. 필수 패키지 설치

```
    $ sudo yum install -y yum-utils device-mapper-persistent-data lvm2

    # docker repo를 등록한다.
    $ sudo yum-config-manager --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

    $ yum package를 업데이트
    $ sudo yum makecache fast
```

### 3. 설치

```
    $ yum install docker-ce

    $ docker --version
    Docker version 19.03.10, build 9424aeaee9
```

### 4. Docker-compose 설치

```
    $ curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

    $ chmod +x /usr/local/bin/docker-compose
```

### 5. 설치 확인

```
    $ docker-compose --version
```

참고 - https://gracefullight.dev/2017/07/23/Install-docker-docker-compose-to-centos/
