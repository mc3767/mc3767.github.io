---
layout: post
title: http로 접속했을 경우 http로 redirect하는 방법
description: "apache 2.x 서버에서 http로 접속했을 경우 http로 redirect하는 방법"
modified: 2014-12-24
tags: [apaceh, https, redirect]
#image:
#  feature: abstract-3.jpg
#  credit: dargadgetz
#  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
---

#### apache 2.x 서버에서 http로 접속했을 경우 http로 redirect하는 방법

### - 필요 모듈 : mod_rewrite

### - httpd.conf 설정

```
RewriteEngine On
RewriteCond %{HTTPS} !=on
RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R,L]
```

### 예1. redirect https 직접 지정 (httpd.conf)

```
<VirtualHost *:80>
    ServerName yourdomain.com
    Redirect permanent / https://yourdomain.com/
</VirtualHost>

<VirtualHost _default_:443>
    ServerName yourdomain.com
    DocumentRoot /usr/local/apache2/htdocs
    SSLEngine On
    ...
</VirtualHost>
```

### 예2. 모든 80 -> 443으로 지정 (httpd.conf)

```
<VirtualHost *:80>
    ServerName yourdomain.com
    RewriteEngine On
    RewriteCond %{HTTPS} !=on
    RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R,L]
</VirtualHost>

<VirtualHost _default_:443>
    ServerName yourdomain.com
    DocumentRoot /usr/local/apache2/htdocs
    SSLEngine On
    ...
</VirtualHost>
```
