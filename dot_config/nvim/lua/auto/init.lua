-- Sets a autocmd for the given hook
--
-- @param action Action to listen to
-- @param file File filter to use
-- @param command Command to fire
local function autocmd(action, file, command)
	vim.cmd("autocmd " .. action .. " " .. file .. " " .. command)
end

-- Colorscheme
autocmd("vimenter", "*", "++nested colorscheme srcery")

-- stylua
autocmd("BufWritePre", "*.lua", ":silent lua require('stylua').format()")

-- Nushell
autocmd("BufEnter", "*.nu", ":TSEnable highlight")

-- Tab sizing
for _, filetype in ipairs({ "markdown", "telekasten", "nix", "json" }) do
	autocmd("FileType", filetype, "setlocal shiftwidth=2 softtabstop=2 expandtab")
end
