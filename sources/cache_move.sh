#!/bin/bash
# 이 파일을 startup applications preferences에 등록해야 정상 동작함

# .cache to goinfre
if [ ! -d "/home/takwak/goinfre/.cache" ]; then
	mkdir -p /home/takwak/goinfre/.cache
	ibus-daemon -rxRd
fi

# .npm cache to goinfre
if [ ! -d "/home/takwak/goinfre/.npm_cache" ]; then
	mkdir -p /home/takwak/goinfre/.npm_cache
	mkdir -p /home/takwak/goinfre/.npm_cache/_cacache
	mkdir -p /home/takwak/goinfre/.npm_cache/_logs
	mkdir -p /home/takwak/goinfre/.npm_cache/_npx
fi

# install postman to goinfre
if [ ! -d "/home/takwak/goinfre/Postman" ]; then
	tar -xzf /home/takwak/Documents/app/postman-linux-x64.tar.gz -C /home/takwak/goinfre
	update-desktop-database ~/.local/share/applications
fi
