local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local lain = require("lain")
-- local battery_widget = require("widgets/battery")

--local separators = lain.util.separators

local wallpapers = {
    os.getenv("HOME") .. "/.config/awesome/wallpapers/x-left.jpg",
    os.getenv("HOME") .. "/.config/awesome/wallpapers/x-right.jpg",
    -- os.getenv("HOME") .. "/.config/awesome/wallpapers/011-left.jpg",
    -- os.getenv("HOME") .. "/.config/awesome/wallpapers/011-right.jpg",
    -- os.getenv("HOME") .. "/.config/awesome/wallpapers/107-left.jpg",
    -- os.getenv("HOME") .. "/.config/awesome/wallpapers/107-right.jpg",
    -- os.getenv("HOME") .. "/.config/awesome/wallpapers/IMG_209880.jpg",
}

local function set_wallpaper(s)
    -- Wallpaper
    for i, wallpaper in ipairs(wallpapers) do
        if i == s.index then
          if type(wallpaper) == "function" then
              wallpaper = wallpaper(s)
          end
          gears.wallpaper.centered(wallpaper, s, "#000000")
        end
    end
end

local function init_screen (screen)
    -- Wallpaper
    set_wallpaper(screen)

    -- Each screen has its own tag table.
    awful.tag(
    -- 'α', 'β', 'γ', 'δ', 'ε', 'ζ', 'η', 'θ', 'ι', 'κ', 'λ', 'μ', 'ν', 'ξ', 'ο', 'π', 'ρ', 'ς', 'σ', 'τ', 'υ', 'φ', 'χ', 'ψ',
    --  { 'α', 'β', 'γ', 'δ', 'ε', 'ζ', 'η', 'θ', 'ι' },
    --  { '一', '二', '三', '四', '五', '六', '七', '八', '九' },
    --  { '⋕', '⋕', '⋕', '⋕', '⋕', '⋕', '⋕', '⋕', '⋕' },
    --  { '▢', '▢', '▢', '▢', '▢', '▢', '▢', '▢', '▢' },
    --  { '◆', '◆', '◆', '◆', '◆', '◆', '◆', '◆', '◆' },
    --  { '◯', '◯', '◯', '◯', '◯', '◯', '◯', '◯', '◯' },
    --  { '☮', '☮', '☮', '☮', '☮', '☮', '☮', '☮', '☮' },
    --  { '☰', '☰', '☰', '☰', '☰', '☰', '☰', '☰', '☰' },
    --  { '≣', '≣', '≣', '≣', '≣', '≣', '≣', '≣', '≣' },
    --  { '⛧', '⛧', '⛧', '⛧', '⛧', '⛧', '⛧', '⛧', '⛧' },
    --  { '✜', '✜', '✜', '✜', '✜', '✜', '✜', '✜', '✜' },
        { '⚫', '⚫', '⚫', '⚫', '⚫', '⚫', '⚫', '⚫', '⚫' },
        screen,
        awful.layout.layouts[1]
    )

--    local arrow = separators.arrow_left(beautiful.bg_normal, "alpha")

    -- Create a promptbox for each screen
    screen.promptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    local mylayoutbox = awful.widget.layoutbox(screen)
    mylayoutbox:buttons(awful.util.table.join(
       awful.button({ }, 1, function () awful.layout.inc( 1) end),
       awful.button({ }, 3, function () awful.layout.inc(-1) end),
       awful.button({ }, 4, function () awful.layout.inc( 1) end),
       awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    local mytaglist = awful.widget.taglist(
        screen,
        awful.widget.taglist.filter.all,
        require('bindings').taglist_buttons()
    )

    -- Create a tasklist widget
    local mytasklist = awful.widget.tasklist(
        screen,
        awful.widget.tasklist.filter.currenttags,
        require('bindings').tasklist_buttons()
    )

    -- Create the wibox
    local mywibox = awful.wibar({
        position = "top",
        opacity = .9,
        screen = screen
    })

    -- define your battery widget
    -- battery = battery_widget({
    --     adapter = "BAT1",
    --     battery_prefix = "",
    --     timeout = 5
    -- })

    mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            mytaglist,
            screen.promptbox,
        },
        mytasklist,
        {
            layout = wibox.layout.fixed.horizontal,
            awful.widget.keyboardlayout(),
            wibox.widget.systray(),
            -- battery.widget,
            wibox.widget.textclock(" %x %H:%M ", 1),
            mylayoutbox,
        },
    }

end

awful.screen.connect_for_each_screen(init_screen)
