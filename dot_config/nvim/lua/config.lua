-- Setup plugins
require("plugins")

-- Setup global variables
require("global")

-- Setup keybindinds
require("bindings")

-- Setup auto CMD hooks
require("auto")

require("rust-tools").setup({
	tools = {
		inlay_hints = {
			auto = true,
		},
	},
})
