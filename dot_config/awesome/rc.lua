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
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Load Debian menu entries
pcall(require, "freedesktop")
naughty.config.defaults["icon_size"] = dpi(150)

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
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
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
local home = os.getenv("HOME")
beautiful.init(home .. "/.config/awesome/theme.lua")

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

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.floating,
}
-- }}}

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local active_client_widget = wibox.widget({
	widget = wibox.widget.textbox,
})

local battery_watch = awful.widget.watch("acpi -b", 60, function(widget, stdout)
	for m in stdout:gmatch("%d?%d%d%%") do
		widget:set_text(m)
	end
end)

local function wrap_with_background(widget)
	return wibox.widget({
		widget = wibox.container.margin,
		top = dpi(5),
		bottom = dpi(5),
		right = dpi(6),
		{
			widget = wibox.container.background,
			bg = beautiful.bg_light,
			{
				widget = wibox.container.margin,
				left = dpi(6),
				right = dpi(6),
				top = dpi(3),
				bottom = dpi(3),
				widget,
			},
		},
	})
end

local function wrap_with_icon(widget, icon, icon_color)
	return wibox.widget({
		layout = wibox.layout.fixed.horizontal,
		spacing = dpi(6),
		{
			widget = wibox.container.background,
			fg = icon_color,
			{
				widget = wibox.widget.textbox,
				font = beautiful.icon_font,
				markup = icon,
			},
		},
		widget,
	})
end

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		widget_template = {
			widget = wibox.container.background,
			id = "background_role",
			{
				widget = wibox.container.margin,
				left = 14,
				right = 14,
				{
					widget = wibox.layout.fixed.horizontal,
					{
						widget = wibox.widget.textbox,
						id = "text_role",
					},
				},
			},
		},
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the wibox
	s.bar = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.bar:setup({
		layout = wibox.layout.align.horizontal,
		expand = "outside",
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			{
				widget = wibox.container.margin,
				right = dpi(4),
			},
			wrap_with_background(active_client_widget),
		},
		s.taglist,
		{ -- Right widgets
			layout = wibox.layout.align.horizontal,
			{
				layout = wibox.layout.fixed.horizontal,
			},
			{
				layout = wibox.layout.fixed.horizontal,
			},
			{
				layout = wibox.layout.fixed.horizontal,
				{
					widget = wibox.container.margin,
					top = dpi(5),
					bottom = dpi(5),
					right = dpi(6),
					visible = (function()
						local _, _, result = os.execute("which acpi")
						return result == 0
					end)(),
					{
						widget = wibox.container.background,
						bg = beautiful.bg_light,
						{
							widget = wibox.container.margin,
							left = dpi(6),
							right = dpi(6),
							top = dpi(3),
							bottom = dpi(3),
							wrap_with_icon(battery_watch, "", beautiful.colours.magenta),
						},
					},
				},
				wrap_with_background(wrap_with_icon(wibox.widget.textclock("%H:%M"), "", beautiful.colours.green)),
				wrap_with_background(s.mylayoutbox),
			},
		},
	})
end)
-- }}}

require("bindings")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			screen = awful.screen.preferred,
			buttons = clientbuttons,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
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
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"Pavucontrol",
			},
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
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

local function update_focused_name_signal(c)
	active_client_widget.markup = "<b>" .. c.name .. "</b>"
end

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus

	update_focused_name_signal(c)
	c:connect_signal("property::name", update_focused_name_signal)
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal

	c:disconnect_signal("property::name", update_focused_name_signal)
end)
-- }}}
