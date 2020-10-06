---
layout: post
title: "PostgresSQL과 PostGis 3를 CentOS 7에 설치하기"
description: "PostgresSQL 10과 PostGis 설치 방법"
tags: [PostgresSQL10, postgis]
modified: 2020-10-05
image:
  #feature: abstract-7.jpg
  #credit: dargadgetz
  #creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
---

## I. PostgreSql 10 yum 설치

### 1. 버전에 맞는 저장소 설치

    down load -- https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
    $ rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm

### 2. 설치

    $ yum install -y postgresql10-server postgresql10 postgresql10-contrib

### 3. DB 초기화

    $ /usr/pgsql-10/bin/postgresql-10-setup initdb
    ==> Initializing database ... OK

### 4. postgresql 구동 및 부팅시 자동 실행

    $ systemctl start postgresql-10
    $ systemctl status postgresql-10

### 5. 접속 확인

    Postgresql에 접속. root 계정에서 아래의 명령어를 사용하여 postgres 계정에 접속하면 된다.

    $ su postgres
    $ cd /usr/pgsql-10/bin
    $ psql

### 6. 패스워드 변경

    postgres=# lter user postgres with password 'postgres';
    ALTER USER

### 7. 설정파일 수정

#### postgresql.conf 파일 수정

    #listen_addresses = 'localhost' <-------- 주석을 제거하고 localhost를 \* 변경
    #max_connections = 100 <-------- 주석을 제거하고 max_connections = 2000 내용 변경
    #shared_buffers = 128MB <-------- 주석을 제거하고 shared_buffers = 128000MB 내용 변경
    #work_mem = 4MB <-------- 주석을 제거하고 work_mem = 51200MB
    #max_files_per_process = 1000 <-------- 주석을 제거하고 max_files_per_process = 15000

#### pg_hba.conf 파일 수정

    $ vi /home/postgres/10/data/pg_hba.conf
    설치서버에서 접속시 내용 수정
    local all all trust <------- trust 를 password 변경
    외부에서 호스트로 접속시 내용 수정
    host all all 127.0.0.1/32 trust <------- 127.0.0.1/32 를 0.0.0.0/0 변경, trust 를 password 변경

## II. PostGis 3.0.0 소스설치

    사전 필수 항목
    gcc
    gcc-c++
    make
    proj 4.9 이상
    geos 3.7 이상
    libxml2 2.5이상
    json-c 0.9이상
    gdal 1.9이상

### 1. Yum Repository Update 이후 없는 패키지 설치

    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

    아래 진행하면서 없어서 문제가 된 패키지 모음

    yum group install "Development Tools"
    yum install proj.x86_64
    yum install libicu-devel
    yum install libxml2-devel
    yum install gdal23.x86_64
    yum install geos37.x86_64
    yum install bzip2
    yum install gcc
    yum install gcc-c++
    yum install json-c-devel
    yum install build-essential libtool
    yum install json-c-devel
    yum install SFCGAL-devel

### 2. postgis devel 패키지 설치

    download
    https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/postgresql10-devel-10.14-1PGDG.rhel7.x86_64.rpm
    https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/postgresql10-libs-10.14-1PGDG.rhel7.x86_64.rpm

    rpm -ivh ----.rpm

### 3. geos-3.7.3 다운로드 및 설치

    $ wget http://download.osgeo.org/geos/geos-3.7.3.tar.bz2
    $ tar -xvf geos-3.7.3.tar.bz2
    $ cd geos-3.7.3
    $ ./configure --prefix=/usr/local/geos
    $ make
    $ make install

### 4. proj-4.9.3 다운로드

    $ wget http://download.osgeo.org/proj/proj-4.9.3.tar.gz
    $ tar -xvf proj-4.9.3.tar.gz
    $ cd proj-4.9.3
    $ ./configure --prefix=/usr/local/proj && make && make install
    ( error 발생시 #autoreconf -f -i )

### 5. gdal-2.4.3 다운로드

    $ wget http://download.osgeo.org/gdal/2.4.3/gdal-2.4.3.tar.gz
    $ tar -xvf gdal-2.4.3.tar.gz
    $ cd gdal-2.4.3
    $ ./configure --prefix=/usr/local/gdal
    $ make && make install

### 6. postgis 소스 컴파일

    $ wget http://download.osgeo.org/postgis/source/postgis-3.0.0.tar.gz
    $ tar -xvf postgis-3.0.0.tar.gz
    $ cd /usr/local/src/postgis-3.0.0

    $ ./configure --prefix=/usr/pgsql-10/postgis --with-pgconfig=/usr/pgsql-10/bin/pg_config --with-geosconfig=/usr/local/geos/bin/geos-config -with-projdir=/usr/local/proj --with-gdalconfig=/usr/local/gdal/bin/gdal-config
    $ make
    $ make install

### 7. PostGIS 확장 및 배포 구축

    $ cd /usr/local/src/postgis-3.0.0/extensions/postgis
    $ make clean
    $ make
    $ make install

    $ cd ../postgis_topology
    $ make clean
    $ make
    $ make install

    $ cd ../postgis_tiger_geocoder
    $ make clean
    $ make
    $ make install

### 8. 확장

    다음의 쿼리를 실행하여 installed_version을 확인한다.
    postgres=# SELECT name, default_version,installed_version FROM pg_available_extensions WHERE name LIKE 'postgis%' ;

    name | default_version | installed_version
    ------------------------+-----------------+-------------------
    postgis_topology | 3.0.0 |
    postgis_tiger_geocoder | 3.0.0 |
    postgis | 3.0.0 |
    (3 rows)

    postgres=# CREATE EXTENSION postgis;
    postgres=# CREATE EXTENSION postgis_topology;

    postgres=# CREATE EXTENSION postgis; <-----정상적으로 불러오지 못함
    postgres=# CREATE EXTENSION postgis_topology; <-----정상적으로 불러오지 못함

    위 애러내용 해결 -> /usr/local/lib 폴더의 파일과 하위 폴더를 /usr/pgsql-10/lib로 복사하여 다시실행한 후 확인

    (설치 위치가 틀리면 proj-4.8.0/geos-3.5.1/gdal-1.9.2 설치 위치를 확인하여 해당 내용의 lib하위 내용 복사)

    $ cp -p -r /usr/local/proj/lib/\* /usr/pgsql-10/lib/
    $ cp -p -r /usr/local/geos/lib/\* /usr/pgsql-10/lib
    $ cp -p -r /usr/local/gdal/lib/\* /usr/pgsql-10/lib

    postgres=# CREATE EXTENSION postgis;
    postgres=# CREATE EXTENSION postgis_topology;
    postgres=# CREATE EXTENSION postgis_tiger_geocoder CASCADE;

### 9 최종 확인

    postgres=# select st_astext(st_transform(st_setsrid(st_makepoint(126.976796611537, 37.5802322231513),4326),900913));

    아래와 같이 값이 나오는지 확인
    "POINT(14134992.3413574 4520295.24555993)"
