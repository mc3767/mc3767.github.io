---
layout: post
title: CentOS / RHEL / Fedora에서 vnStat (네트워크 모니터링 도구)를 설정하는 방법
description: "네트워크 인터페이스에서 대역폭 (전송 및 수신)을 계산하고 자체 데이터베이스에 저장하는 유틸리티"
modified: 2019-10-01
tags: [vnStat,  네트워크 모니터링]
#image:
#  creditlink: https://tecadmin.net/how-to-monitor-bandwidth-under-centos-linux-using-vnstat/
---
네트워크 인터페이스에서 대역폭 (전송 및 수신)을 계산하고 자체 데이터베이스에 저장하는 유틸리티입니다. 

## 설치 및 설정

### 1. Yum을 사용하여 vnStat 패키지 설치
yum 명령 줄 유틸리티를 사용하여 시스템에 vnstat 패키지를 설치합니다.

```
# yum install vnstat
```

### 2. 데이터베이스 초기화
vnStat는 모든 정보를 데이터베이스에 보관합니다.  
아래 명령을 사용하여 네트워크 인터페이스 용 데이터베이스를 생성합니다. 이 기사는 em1 인터페이스를 사용하고 있습니다. 필요에 따라 인터페이스 이름을 변경하십시오.  

```
# vnstat -u -i eth0
```

### 3. 크론 예약
vnStat는 cron 작업을 사용하여 데이터베이스를 업데이트합니다. 기본적으로 5 분 간격으로 실행되도록 구성되어 있습니다. 
```
*/5 * * * * /usr/bin/vnstat -u -i em1
```

### 4. 디폴트 인터페이스 지정
기본적으로 vnStat는 eth0에서 정보를 수집하고 / etc / sysconfig / vnstat 파일을 편집 하고 아래와 같이 옵션을 업데이트 하도록 구성 됩니다.

```
VNSTAT_OPTIONS = "-i emi"
````

### 5. 부팅시 자동 실행 설정 등

```
# 자동 실행 설정
$ chkconfig vnstat on

# 서비스 시작, 중지 등
$ service vnstat start
$ service vnstat stop
$ service vnstat restart
$ service vnstat status
```


## 사용방법 

### 하루에 대한 통계 표시
```
$ vnstat -d
```

### 한 달 동안의 통계보기
```
$ vnstat -m
```
### 한 시간 동안 통계 표시
```
$ vnstat -h
```
### 실시간 통계 표시
```
$ vnstat -l
```