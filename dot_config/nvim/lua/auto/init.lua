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

-- Coc format
autocmd("BufWritePre", "*.rs", ":silent call CocAction('runCommand', 'editor.action.organizeImport')")
autocmd("BufWritePre", "*.rs", ":silent call CocAction('runCommand', 'editor.action.formatDocument')")
