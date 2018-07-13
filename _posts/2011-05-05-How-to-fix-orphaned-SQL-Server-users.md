---
layout: post
title: SQL 복원시 사용자 연결하기
description: How to fix orphaned SQL Server users
modified: 2014-12-24
tags: [SQL]
image:
  feature: abstract-3.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
---

"SQL 백업에서 복원하거나 디비파일을 연결하면 사용자 연결이 필요하다"
Share on PinboardShare on HackerNewsShare on TwitterShare on FacebookShare on Reddit
Summary
When you restore a Microsoft SQL Server database on a different machine, you cannot access the database until you fix the permissions.

Detail
The problem is that the user in the database is an "orphan". This means that there is no login id or password associated with the user. This is true even if there is a login id that matches the user, since there is a GUID (called a SID in Microsoft-speak) that has to match as well.

This used to be a pain to fix, but currently (SQL Server 2000, SP3) there is a stored procedure that does the heavy lifting.

All of these instructions should be done as a database admin, with the restored database selected.

First, make sure that this is the problem. This will lists the orphaned users:

```
 EXEC sp_change_users_login 'Report'
```

If you already have a login id and password for this user, fix it by doing:

```
 EXEC sp_change_users_login 'Auto_Fix', 'user'
```

If you want to create a new login id and password for this user, fix it by doing:

```
 EXEC sp_change_users_login 'Auto_Fix', 'user', 'login', 'password'
```

