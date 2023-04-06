return function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.norg.concealer"] = {},
			["core.norg.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/notes-v2/",
					},
				},
			},
			["core.keybinds"] = {
				config = {
					hook = function(keybinds)
						keybinds.map("norg", "n", "<Tab>", "<cmd>lua require('fold-cycle').open()<CR>")
					end,
				},
			},
			["core.norg.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
		},
	})
end
