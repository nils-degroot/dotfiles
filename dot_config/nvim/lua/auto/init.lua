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
autocmd("FileType", "markdown", "setlocal shiftwidth=2 softtabstop=2 expandtab")
autocmd("FileType", "telekasten", "setlocal shiftwidth=2 softtabstop=2 expandtab")
autocmd("FileType", "nix", "setlocal shiftwidth=2 softtabstop=2 expandtab")
