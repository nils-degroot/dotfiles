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
	-- Setup neovide
	require("neovide")
end
