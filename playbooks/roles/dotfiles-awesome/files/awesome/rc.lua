require("awful.autofocus")
local beautiful = require("beautiful")
local menubar = require("menubar")

require('error-handling')

beautiful.init(require("theme/theme"))

terminal = "x-terminal-emulator"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor

require('layouts')

menubar.utils.terminal = terminal

require('signals')
require('screen-init')
require('rules').install()
root.buttons(require('bindings').mouse())
root.keys(require('bindings').global())
