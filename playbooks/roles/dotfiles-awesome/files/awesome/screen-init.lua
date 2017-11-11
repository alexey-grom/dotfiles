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
    set_wallpaper(screen)

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

    screen.promptbox = awful.widget.prompt()

    local layoutbox = awful.widget.layoutbox(screen)
    layoutbox:buttons(awful.util.table.join(
       awful.button({ }, 1, function () awful.layout.inc( 1) end),
       awful.button({ }, 3, function () awful.layout.inc(-1) end),
       awful.button({ }, 4, function () awful.layout.inc( 1) end),
       awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))

    local taglist = awful.widget.taglist(
        screen,
        awful.widget.taglist.filter.all,
        require('bindings').taglist_buttons()
    )

    local tasklist = awful.widget.tasklist(
        screen,
        awful.widget.tasklist.filter.currenttags,
        require('bindings').tasklist_buttons()
    )

    local topbar = awful.wibar({
        position = "top",
        opacity = .9,
        --border_width = 2,
        --border_color = '#444444',
        screen = screen
    })

    local right
    if screen.index == 1 then
        local clock = wibox.widget.textclock("%Y-%m-%d %H:%M ", 1)
        --local calendar = awful.widget.calendar.year()
        --calendar:attach(clock)
        right = {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            awful.widget.keyboardlayout(),
            clock,
            layoutbox
        }
    else
        right = {
            layout = wibox.layout.fixed.horizontal,
            layoutbox
        }
    end

    topbar:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            taglist,
            screen.promptbox,
        },
        tasklist,
        right
    }

end

awful.screen.connect_for_each_screen(init_screen)
