local auto = vim.api.nvim_create_autocmd

-- Highlighted yank
auto("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 500,
		})
	end,
})
