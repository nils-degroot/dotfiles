local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Custom widgets
local two_sided_presets = require("sprimed.widgets.presets.two-sided")

-- Wibox
local wibox = require("wibox")

-- Responsive sizing
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Get the hostname
local hostname
for line in io.open("/etc/hostname", "r"):lines() do
	hostname = line
	break
end

local mpd_widget_render
local mpd_widget = two_sided_presets.mpd:new{
	left_bg = beautiful.bg_normal,
	icon = ""
}
mpd_widget.right_inner.tick_hook = function(state)
	mpd_widget_render.visible = state ~= "stopped"
end

mpd_widget_render = mpd_widget:render()

-- Setup taglist buttons
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t)
		t:view_only()
    end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t)
        awful.tag.viewnext(t.screen)
    end),
    awful.button({ }, 5, function(t)
        awful.tag.viewprev(t.screen)
    end)
)

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function(c)
		if c == client.focus then
		    c.minimized = true
		else
    	    c:emit_signal("request::activate", "tasklist", { raise = true })
    	end
    end),
    awful.button({ }, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({ }, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({ }, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

-- Set wallpaper
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

local function ternary(condition, lhs, rhs)
    if condition then
		return lhs
	else
		return rhs
	end
end

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Connect screens
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "I", "II", "III", "IV", "V" }, s, awful.layout.suit.tile)

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({ }, 3, function()
            awful.layout.inc(-1)
        end),
        awful.button({ }, 4, function()
            awful.layout.inc(1)
        end),
        awful.button({ }, 5, function()
            awful.layout.inc(-1)
        end)
	))

    -- Create a taglist widget
    s.taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
		layout = wibox.layout.fixed.horizontal,
        buttons = taglist_buttons,
		widget_template = {
			{
				{
				    id = "text_role",
				    widget = wibox.widget.textbox
				},
				top = dpi(6),
				bottom = dpi(6),
				left = dpi(10),
				right = dpi(10),
				widget = wibox.container.margin
	    	},
			id = 'background_role',
	    	widget = wibox.container.background,
	    	create_callback = function(self, _, _, _)
				-- mouse enter
                self:connect_signal("mouse::enter", function()
					if self.bg ~= beautiful.taglist_bg_hover then
					    self.backup = self.bg
					    self.has_backup = true
						self.bg = beautiful.taglist_bg_hover
					end
                end)
				-- mouse leave
                self:connect_signal("mouse::leave", function()
					if self.has_backup then
		    		    self.bg = self.backup
		    		end
                end)
				-- mouse press
                self:connect_signal("button::press", function(_, _, _, btn)
					if btn == 1 then
						self.bg = beautiful.taglist_bg_focus
						self.has_backup = false
					end
                end)
			end
		}
    }

    -- Create a tasklist widget
    s.tasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        widget_template = {
			{
				{
				    {
						id = 'icon_role',
						widget = wibox.widget.imagebox,
	    		    },
	    		    margins = 2,
	    		    widget  = wibox.container.margin,
				},
				left  = 5,
				right = 5,
				widget = wibox.container.margin
	    	},
	    	id = 'background_role',
	    	widget = wibox.container.background,
		},
    }

    -- Create the wibox
    s.bar = awful.wibar({
        position = "top",
        screen = s,
		bg = beautiful.bg_normal
    })

	local center_text = wibox.widget {
		markup = "<b>Welcome</b>",
		widget = wibox.widget.textbox
	}

	local set_center_text = function(c)
		center_text.markup = "<b>" .. (c.name or c.class or "An unnamed window") .. "</b>"
	end

	client.connect_signal("focus", function(c) -- Add a signal to update the name
		set_center_text(c)
		c:connect_signal("property::name", set_center_text)
	end)

	client.connect_signal("unfocus", function(c) -- Disconnect the signal to update the name
		c:disconnect_signal("property::name", set_center_text)
	end)

    -- Add widgets to the wibox
    s.bar:setup {
		{
			{
				markup = "",
				widget = wibox.widget.textbox
			},
			center_text,
			{
				markup = "",
				widget = wibox.widget.textbox
			},
			expand = "none",
		    layout = wibox.layout.align.horizontal,
		},
    	{
			{ -- Left widgets
				{
					s.taglist,
					widget = wibox.container.background,
					bg = beautiful.bg_normal,
	    		},
				s.tasklist,
	    		layout = wibox.layout.align.horizontal,
			},
			{ -- Center widgets
			    layout = wibox.layout.align.horizontal,
			},
			{ -- Right widgets
				{
					ternary(
						hostname == "void-nils",
						mpd_widget_render,
						two_sided_presets.battery:new{ left_bg = beautiful.bg_normal }:render()
					),
				    two_sided_presets.mem:new{ left_bg = beautiful.bg_normal }:render(),
				    two_sided_presets.df:new{ left_bg = beautiful.bg_normal }:render(),
				    two_sided_presets.clock:new{ left_bg = beautiful.bg_normal }:render(),
					{
						markup = "|",
						widget = wibox.widget.textbox
					},
					{
						wibox.widget.systray(),
						s.mylayoutbox,
				    	layout = wibox.layout.fixed.horizontal
					},
					spacing = 3,
				    layout = wibox.layout.fixed.horizontal,
				},
				widget = wibox.container.background,
				fg = beautiful.fg_dark,
				bg = beautiful.bg_normal
			},
    	    layout = wibox.layout.align.horizontal,
			expand = "inside",
    	},
        layout = wibox.layout.stack,
	}
end)
