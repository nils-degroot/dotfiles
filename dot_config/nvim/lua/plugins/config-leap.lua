return function()
	vim.keymap.set({ "n", "v" }, "s", "<Plug>(leap-forward-to)")
	vim.keymap.set({ "n", "v" }, "S", "<Plug>(leap-backward-to)")
	vim.keymap.set({ "n", "v" }, "gs", "<Plug>(leap-from-window)")
end
