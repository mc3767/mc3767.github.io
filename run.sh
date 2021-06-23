#!/bin/sh
bundle exec jekyll serve --trace --watch

# 필요설치 ( 글로벌 설치 - https://jekyllrb-ko.github.io/docs/installation/macos/ )

# Mojave 버전 (10.14)Permalink
# Mojave 의 시스템 무결성 보호 (SIP) 기능 때문에, 다음과 같이 실행해야 합니다:

# sudo gem install bundler
# sudo gem install -n /usr/local/bin/ jekyll
# sudo gem install -n /usr/local/bin/ jekyll-feed

# error
# --> Could not find multipart-post-2.1.1 in any of the sources
#     Run `bundle install` to install missing gems.
# ==> bundle update --bundler
