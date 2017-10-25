local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local mymainmenu = awful.menu({
    items = {
        { "open terminal", terminal },
        -- { "Debian", debian.menu.Debian_menu.Debian },
        { "hotkeys", function() return false, hotkeys_popup.show_help end},
        { "manual", terminal .. " -e man awesome" },
        { "edit config", editor_cmd .. " " .. awesome.conffile },
        { "restart", awesome.restart },
        { "quit", function() awesome.quit() end }
    }
})

return mymainmenu
