-- Setup plugins
require("plugins")

-- Setup global variables
require("global")

-- Setup keybindinds
require("bindings")

-- Setup auto CMD hooks
require("auto")

-- Neovide
if vim.g.neovide then
	vim.o.guifont = "Iosevka Term:h12"
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_cursor_vfx_mode = "ripple"
end
