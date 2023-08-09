return function()
	local leap = require("leap")

	vim.keymap.set("n", "s", "<Plug>(leap-forward-to)")
	vim.keymap.set("n", "S", "<Plug>(leap-backward-to)")
	vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
end
