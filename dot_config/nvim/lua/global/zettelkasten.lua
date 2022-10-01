local home = vim.fn.expand("~/Documents/notes")

require("telekasten").setup({
	home = home,
	tag_notation = "yaml-bare",
})
