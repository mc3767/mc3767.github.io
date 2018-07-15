---
layout: post
title: SQL Server Management Studio의 테이블 디자이너에 설명(Description) 추가하기
description: "SQL Server - showing extra columns in design viewß"
modified: 2018-07-15
tags: [ssms, sql, design]
---

### SQL Server Management Studio의 테이블 디자이너에 설명(Description)이 보이도록  추가하는 방법입니다.  레지스트리 설정의 값을 변경하는 단계가 있습니다.

### SQL Server 2008
> HKEY_CURRENT_USER\Software\Microsoft\SQL Server Management Studio\11.0\DataProject

### SQL Server 2014
> HKEY_CURRENT_USER\Software\Microsoft\SQL Server Management Studio\12.0\DataProject

### SQL Server 2016
> HKEY_CURRENT_USER\Software\Microsoft\SQL Server Management Studio\13.0\DataProject

## 변경내용

> SSVPropViewColumnsSQL70 변경전 1,2,6; 변경후 1,2,6,17,7,8,9,10;
> SSVPropViewColumnsSQL80 변경전 1,2,6; 변경후 1,2,6,17,7,8,9,10;

## 주의사항 

SSMS를 다시 시작해야 적용되며, SSMS 싫행중에 변경하면 적용되지 않고 수정전 값으로 바뀜. 

## Property sequence:

1. Column Name
2. Data Type
3. Length
4. Precision
5. Scale
6. Allow Nulls
7. Default Value
8. Identity
9. Identity Seed
10. Identity Increment
11. Row GUID
12. Nullable
13. Condensed Type
14. Not for Replication
15. Formula
16. Collation
17. Description

