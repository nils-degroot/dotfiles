local gears = require("gears")
local awful = require("awful")

-- Hotkey popup
local hotkeys_popup = require("awful.hotkeys_popup")

-- Lock widget
local logout_popup = require("sprimed.menu.logout-popup")

-- Bling
local bling = require("bling")

local modifiers = {
	["control"] = "Control",
	["shift"] = "Shift",
	["alt"] = "Mod1",
	["super"] = "Mod4"
}

local hypr = {
	modifiers.control,
	modifiers.shift,
	modifiers.alt,
	modifiers.super
}

modkey = modifiers.super


globalkeys = gears.table.join(
	awful.key({ modkey, }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	awful.key({ modkey, }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),

	awful.key({ modkey, }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),

	awful.key({ modkey, }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),

	awful.key({ modkey, }, "k", function()
	    awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	awful.key({ modkey, }, "r", function()
		awful.spawn("dmenu-pass")
	end, { description = "Open password store", group = "launcher" }),

	awful.key({ modkey, }, "e", function()
		awful.spawn("alacritty -e ranger")
	end, { description = "Open file explorer", group = "launcher" }),

	-- Layout manipulation
	awful.key({ modkey, modifiers.shift }, "j", function()
	    awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),

	awful.key({ modkey, modifiers.shift }, "k", function()
	    awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	awful.key({ modkey, modifiers.control }, "j", function()
	    awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),

	awful.key({ modkey, modifiers.control }, "k", function()
	    awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	awful.key({ modkey, }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	awful.key({ modkey, }, "Tab", function()
	    awful.client.focus.history.previous()

	    if client.focus then
	        client.focus:raise()
	    end
	end, { description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey, }, "t", function()
	    awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),

	awful.key({ modkey, modifiers.control, }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

	awful.key({ modkey, modifiers.shift, }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	awful.key({ modkey, }, "Escape", logout_popup.launch, { description = "Show logout popup", group = "awesome" }),

	awful.key({ modkey, }, "l", function()
	    awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),

	awful.key({ modkey, }, "h", function()
	    awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	awful.key({ modkey, modifiers.shift, }, "h", function()
	    awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),

	awful.key({ modkey, modifiers.shift, }, "l", function()
	    awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),

	awful.key({ modkey, modifiers.control, }, "h", function()
	    awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ modkey, modifiers.control, }, "l", function()
	    awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

	awful.key({ modkey, }, "Return", function()
	    awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),

	awful.key({ modkey, modifiers.shift, }, "Return", function()
	    awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, modifiers.control }, "n", function()
	    local c = awful.client.restore()

	    if c then
	        c:emit_signal("request::activate", "key.unminimize", { raise = true })
	    end
	end, { description = "restore minimized", group = "client" }),

	-- Menubar
	awful.key({ modkey }, "p", function()
		awful.spawn("rofi -show drun -icon-theme Papirus-Dark -show-icons")
	end, { description = "show the menubar", group = "rofi" }),

	awful.key({ modkey, modifiers.shift }, "p", function()
		awful.spawn("rofi -show run")
	end, { description = "show the menubar", group = "rofi" }),

	awful.key({ modkey }, "a", function()
		if os.getenv("HOSTNAME") == "void-nils" then
			awful.spawn("dmenu-mpd")
		else
			awful.spawn("audio-card-profile")
		end
	end, { description = "dmenu-mpd", group = "rofi" }),

	awful.key({ modkey }, "b", function()
		local screen = awful.screen.focused()
		screen.bar.visible = not screen.bar.visible
	end, { description = "Toggle the topbar", group = "screen" }),

	awful.key({ modkey }, "v", function()
		awful.spawn("dmenu-vpn")
	end, { description = "dmenu-vpn", group = "rofi" }),

	awful.key({ modkey }, "w", function()
		awful.spawn("rofi -show window")
	end, { description = "Rofi select windcow", group = "rofi" }),

	-- {{- if eq .chezmoi.hostname "nils-work" }}
	awful.key({ modkey }, "d", function()
		awful.spawn("xrandr-setup")
	end, { description = "xrandr-setup", group = "rofi" }),
	-- {{- end }}

	awful.key({ modkey }, "c", bling.module.tabbed.pick_with_dmenu, { description = "Pick client for tab", group = "bling" }),

	awful.key({ modkey }, "x", bling.module.tabbed.pop, { description = "Pop tabbed client", group = "bling" }),

	awful.key({ modkey }, "z", bling.module.tabbed.iter, { description = "Iterate through a tabbed group", group = "bling" }),

	awful.key({ modkey, modifiers.shift }, "z", function()
		bling.module.tabbed.iter(-1)
	end, { description = "Iterate through a tabbed group counter clock wise", group = "bling" }),

	awful.key(hypr, "F1", function()
		awful.spawn("qutebrowser")
	end, { description = "Open Qutebrowser", group = "macropad" }),

	awful.key(hypr, "F2", function()
		awful.spawn("firefox")
	end, { description = "Open Firefox", group = "macropad" }),

	awful.key(hypr, "F3", function()
		awful.spawn("thunderbird")
	end, { description = "Open Thunderbird", group = "macropad" }),

	awful.key(hypr, "F4", function()
		awful.spawn("alacritty -e ranger")
	end, { description = "Open Ranger", group = "macropad" }),

	awful.key(hypr, "F5", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 5", group = "macropad" }),

	awful.key(hypr, "F6", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 6", group = "macropad" }),

	awful.key(hypr, "F7", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 7", group = "macropad" }),

	awful.key(hypr, "F8", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 8", group = "macropad" }),

	awful.key(hypr, "F9", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 9", group = "macropad" }),

	awful.key(hypr, "F10", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 10", group = "macropad" }),

	awful.key(hypr, "F11", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 11", group = "macropad" }),

	awful.key(hypr, "F12", function()
		awful.spawn("qutebrowser")
	end, { description = "Hotkey 12", group = "macropad" })
)

clientkeys = gears.table.join(
	awful.key({ modkey, }, "f", function(c)
	    c.fullscreen = not c.fullscreen
	    c:raise()
	end, { description = "toggle fullscreen", group = "client" }),

	awful.key({ modkey }, "q", function(c)
	    c:kill()
	end, { description = "close", group = "client" }),

	awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),

	awful.key({ modkey, modifiers.control, }, "Return", function(c)
	    c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),

	awful.key({ modkey, }, "o", function(c)
	    c:move_to_screen()
	end, { description = "move to screen", group = "client" }),

	awful.key({ modkey, modifiers.shift }, "o", function(c)
	    c:move_to_screen(c.screen.index - 1)
	end, { description = "move to screen", group = "client" }),

	awful.key({ modkey, }, "t", function(c)
	    c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),

	awful.key({ modkey, }, "m", function(c)
	    -- The client currently has the input focus, so it cannot be
	    -- minimized, since minimized clients can't have the focus.
	    c.minimized = true
	end, { description = "minimize", group = "client" }),

	awful.key({ modkey, }, "n", function(c)
	    c.maximized = not c.maximized
	    c:raise()
	end, { description = "(un)maximize", group = "client" }),

	awful.key({ modkey, "Control" }, "m", function(c)
	    c.maximized_vertical = not c.maximized_vertical
	    c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),

	awful.key({ modkey, modifiers.shift }, "m", function(c)
	    c.maximized_horizontal = not c.maximized_horizontal
	    c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 5 do
    globalkeys = gears.table.join(globalkeys,
		-- View tag only.
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end, { description = "view tag #" .. i, group = "tag" }),

		-- Toggle tag display.
        awful.key({ modkey, modifiers.control }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end, { description = "toggle tag #" .. i, group = "tag" }),

		-- Move client to tag.
        awful.key({ modkey, modifiers.shift }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end, { description = "move focused client to tag #" .. i, group = "tag" }),

		-- Toggle tag on focused client.
        awful.key({ modkey, modifiers.control, modifiers.shift }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end, { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

-- Client mouse bindings
clientbuttons = gears.table.join(
    awful.button({ }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),

    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),

    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 4, awful.tag.viewnext),

    awful.button({ }, 5, awful.tag.viewprev)
))

root.keys(globalkeys)
