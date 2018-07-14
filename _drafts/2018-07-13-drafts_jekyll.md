---
layout: post
title: jekyll 초안 활용하기
description: ""
modified: 2018-07-13
tags: [sjekyll]
image:
  feature: abstract-3.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
---

# jekyll 초안 활용하기

초안이란 날짜 정보가 없는 포스트입니다. 현재 작성중이기 때문에 아직은 온라인에 게시하고 싶지 않은 포스트를 의미합니다. 초안 기능을 사용하려면, 사이트의 루트 디렉토리에 _drafts 폴더를 만들고 (디렉토리 구조 참고) 초안을 생성하면 됩니다:

```
|-- _drafts/
|   |-- a-draft-post.md
```

초안을 포함해서 사이트를 미리보기 하려면, jekyll serve 나 jekyll build 명령에 --drafts 스위치를 추가해서 실행하기만 하면 됩니다. 초안의 작성시간에 해당 파일의 수정시간을 할당하기 때문에, 현재 작업중인 초안이 가장 최신 포스트인 것처럼 표시됩니다.

