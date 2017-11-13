#!/usr/bin/env bash

Xephyr :1 -ac -br -noreset -screen 1152x720 &
sleep 1

RC_PATH="$(pwd)/files/awesome/"
AWESOME_RUNTIME="/etc/xdg/awesome/?.lua;"\
                "/etc/xdg/awesome/?/init.lua;"\
                "/usr/share/awesome/lib/?.lua;"\
                "/usr/share/awesome/lib/?/init.lua"
LUA_PATH="$(lua -e 'print(package.path)');$AWESOME_RUNTIME;${RC_PATH}?.lua"
LUA_PATH=$LUA_PATH DISPLAY=:1.0 awesome -c ${RC_PATH}rc.lua
