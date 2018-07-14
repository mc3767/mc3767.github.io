---
layout: post
title: Jekyll로 블로그 만들기
description: "Jekyll로 블로그를 만드는 과정을 정리해 봄"
modified: 2018-07-13
tags: [Jekyll]
---
## Jekyll 이란게 뭐죠, 한 마디로?

Jekyll 은 아주 심플하고 블로그 지향적인 정적 사이트 생성기입니다.

텍스트(마크다운) 파일로 컨텐츠를 작성하고, 폴더로 그 파일들을 정리합니다. 다음, Liquid 기능이 추가된 HTML 템플릿을 사용해 사이트의 모양을 만듭니다. Jekyll 은 자동으로 내용물과 템플릿들을 함께 합쳐서, 어떤 서버에서도 올바르게 작동하는, 완전한 정적 웹사이트를 생성합니다.

Jekyll 은 GitHub Pages 의 내부 엔진이기 때문에, 당신의 프로젝트에 있는 Jekyll 페이지/블로그/웹사이트를 GitHub 서버에 무료로 호스팅 할 수 있습니다.

## Ruby 설치하기

일단 Jekyll 자체가 하나의 Ruby 패키지 입니다. 즉, Jekyll 을 사용하려면 Ruby 가 있어야 합니다. 각 운영체제별로 Ruby 를 설치하는 방법은 다음과 같습니다.

맥 사용자라면 Ruby 를 설치할 필요가 없습니다. 왜냐면 macOS 에는 이미 Ruby 가 설치되어 있기 때문입니다.

윈도우 사용자라면 Hurderella 님이 정리하신 Windows에서 Github Page와 Jekyll로 블로그 생성하기 라는 글을 보면 될 것 같습니다. 

리눅스 (Linux)	사용자라면 각 배포판 별로 패키지 관리자를 사용해서 설치하면 되는데, 우분투 (Ubuntu) 라면 다음과 같이 설치할 수 있습니다.

```
  $ sudo apt-get install ruby-full
```

## Jekyll 설치하기

Ruby 를 설치했으면 다음과 같이 Gem 이라는 Ruby 의 패키지 관리자를 사용해서 Jekyll 을 설치합니다. 여기서 예전 과 다르게 jekyll 뿐만 아니라 bundler 도 같이 설치합니다.

```
$ sudo gem install jekyll bundler
```

## Jekyll 로 로컬에 블로그 만들기

Jekyll 로 새 블로그를 만들려면 블로그를 저장할 폴더로 이동해서 다음과 같은 명령을 실행합니다. 아래에서 my-awesome-site 부분은 어차피 나중에 지울 거라서 이름을 아무렇게나 지어도 됩니다.


```
$ jekyll new my-awesome-site
```

그러면 my-awesome-site 라는 폴더가 생기고 그 아래에 다음과 같은 파일 및 폴더들이 생깁니다.

```
.
├── Gemfile
├── Gemfile.lock
├── _config.yml
├── _posts
│   └── 2017-03-05-welcome-to-jekyll.markdown
├── about.md
└── index.md
```

최근의 Jekyll 은 minima 라는 테마를 사용하기 때문에, 예전과는 다르게 Gemfile 등을 써서 패키지들의 의존성을 관리하고 있음을 알 수 있습니다.

로컬에서 Jekyll 블로그 테스트하기
다음의 명령을 사용해서 Jekyll 블로그를 로컬에서 빌드하고 실행합니다.

```
$ bundle exec jekyll serve
```
브라우저를 실행하고 주소창에 http://localhost:4000 를 입력하면 다음과 같은 페이지를 볼 수 있습니다.


## TroubleShooting

$ bundle exe jekyll serve
Configuration file: /Users/jeon/Documents/myBlog/_config.yml
       Deprecation: The 'gems' configuration option has been renamed to 'plugins'. Please update your config file accordingly.
            Source: /Users/jeon/Documents/myBlog
       Destination: /Users/jeon/Documents/myBlog/_site


 Incremental build: disabled. Enable with --incremental
      Generating...
  Liquid Exception: Invalid scheme format: {"feature"=>"abstract-10.jpg", "credit"=>"dargadgetz", "creditlink"=>"http in feed.xml
jekyll 3.8.3 | Error:  Invalid scheme format: {"feature"=>"abstract-10.jpg", "credit"=>"dargadgetz", "creditlink"=>"http      

## 참고 사이트
https://jekyllrb-ko.github.io/docs/home/
https://xho95.github.io/blog/github/pages/jekyll/minima/theme/2017/03/04/Jekyll-Blog-with-Minima.html


