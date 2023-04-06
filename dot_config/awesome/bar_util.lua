local wibox = require("wibox")

local function generate_textbox(markup)
	return wibox.widget({
		markup = markup,
		widget = wibox.widget.textbox,
	})
end

local M = {}

M.seperator = function()
	return generate_textbox("|")
end

M.space = function()
	return generate_textbox("")
end

return M
