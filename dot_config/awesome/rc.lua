-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
local home = os.getenv("HOME")
local config_path = home .. "/.config/awesome/"

beautiful.init(config_path .. "theme.lua")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

local bling = require("bling")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
require("awesomewm-micky")

local dpi = require("beautiful.xresources").apply_dpi
naughty.config.defaults['icon_size'] = dpi(150)

-- Client icon management
local icon_path = "/usr/share/icons/Papirus-Dark/32x32/"

-- Map icon class to icon
require("sprimed.menu.force-icon")({
    ["Firefox"] = icon_path .. "categories/firefox-nightly.svg",
    ["Alacritty"] = icon_path .. "apps/Alacritty.svg",
    ["Thunderbird"] = icon_path .. "categories/thunderbird.svg",
    ["Surf"] = icon_path .. "categories/internet-web-browser.svg",
    ["Steam"] = icon_path .. "categories/steam.svg",
    ["Sxiv"] = icon_path .. "apps/among-us.svg",
    ["MuPDF"] = icon_path .. "mimetypes/application-pdf.svg",
	["Fractal"] = icon_path .. "apps/element-desktop.svg",
	["st-256color"] = icon_path .. "apps/terminal.svg",
})

local has_fdo, freedesktop = pcall(require, "freedesktop")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)

if awesome.startup_errors then
    naughty.notify({
		preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then
            return
        end
        in_error = true

        naughty.notify({
			preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
		})
        in_error = false
    end)
end

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Include modules

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}

total_tags = 5

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

require("bar")
require("bindings")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
		rule = { },
		properties = {
			border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
    },

    -- Floating clients.
    {
		rule_any = {
			instance = {
        	    "DTA", -- Firefox addon DownThemAll.
        	    "copyq", -- Includes session name in class.
        	    "pinentry",
        	},
        	class = {
        	    "Arandr",
        	    "Blueman-manager",
        	    "Gpick",
        	    "Kruler",
        	    "Sxiv",
        	    "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        	    "Wpa_gui",
        	    "veromix",
        	    "xtightvncviewer",
				"Pavucontrol",
			},
        	-- Note that the name property shown in xprop might be set slightly after creation of the client
        	-- and the name shown there might not match defined rules here.
        	name = {
        	    "Event Tester", -- xev.
        	},
        	role = {
        	    "AlarmWindow", -- Thunderbird's calendar.
        	    "ConfigManager", -- Thunderbird's about:config.
        	    "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
        	}
		},
		properties = { floating = true }
	},
    -- Add titlebars to normal clients and dialogs
    {
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true }
    },
}

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
		awful.button({ }, 1, function()
		    c:emit_signal("request::activate", "titlebar", { raise = true })
    	    awful.mouse.client.move(c)
    	end),
    	awful.button({ }, 3, function()
    	    c:emit_signal("request::activate", "titlebar", { raise = true })
    	    awful.mouse.client.resize(c)
    	end)
    )

    awful.titlebar(c, { size = 0 }):setup {
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)
