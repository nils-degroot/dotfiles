# Widgets

![](./widgets.png)

Init lua returns all the widget in a table. call this if you're planning on
using all the widgets. Otherwise, you can call each widget individually.

A individual widget contains at least two attributes:

- `config` The default configuration for the widget
- `widget` A method that returns the actual widget. Has one argument for a
  custom config. Will be the default config is left `nil`

```lua
-- Include widgets
local widgets = require("src.widgets")

-- Configure
local df_config = widgets.df.config
df_config.bg_left = "#00ff00"

-- Render the widget
widgets.df.widget(df_config)
```

## Default configurations

### Battery

This widget is unfinished.

### Clock

```lua
local config = {
    -- Icon
    ["icon"] = " ",
    ["bg_left"] = beautiful.bg_focus,
    ["icon_margin_left"] = 5,
    ["icon_margin_right"] = 2,
    -- Text
    ["bg_right"] = beautiful.bg_dark,
    ["text_margin_left"] = 0,
    ["text_margin_right"] = 0,
}
```

### Df

```lua
local config = {
    -- Icon
    ["icon"] = " ",
    ["bg_left"] = beautiful.bg_focus,
    ["icon_margin_left"] = 5,
    ["icon_margin_right"] = 2,
    -- Text
    ["bg_right"] = beautiful.bg_dark,
    ["text_margin_left"] = 5,
    ["text_margin_right"] = 5,
    -- Etc
    ["timeout"] = 60
}
```

### Mem

```lua
local config = {
    -- Icon
    ["icon"] = " ",
    ["bg_left"] = beautiful.bg_focus,
    ["icon_margin_left"] = 5,
    ["icon_margin_right"] = 2,
    -- Text
    ["bg_right"] = beautiful.bg_dark,
    ["text_margin_left"] = 5,
    ["text_margin_right"] = 5,
    -- Etc
    ["timeout"] = 60
}
```

### Mpd

```lua
local config = {
    -- Left block
    ["icon"] = " ",
    ["bg_left"] = beautiful.bg_focus,
    ["icon_margin_left"] = 5,
    ["icon_margin_right"] = 2,
    -- Text
    ["bg_right"] = beautiful.bg_dark,
    ["text_margin_left"] = 5,
    ["text_margin_right"] = 5,
    -- Inner icons
    ["icon_playing"] = "契 ",
    ["icon_paused"] = " ",
    ["icon_stopped"] = "",
    -- Etc
    ["timeout"] = 10,
    ["hide_when_stopped"] = true
}
```
