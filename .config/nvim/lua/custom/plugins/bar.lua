return {
	{
		"feline-nvim/feline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			local line_ok, feline = pcall(require, "feline")
			if not line_ok then
				return
			end

			feline.setup({
				theme = {
					bg = "#1c1b19",
					fg = "#baa67f",
					yellow = "#fbb829",
					cyan = "#0aaeb3",
					darkblue = "#3c78bf",
					green = "#519f50",
					orange = "#ff5f00",
					violet = "#690fad",
					magenta = "#e02c6d",
					blue = "#68a8e4",
					red = "#ef2f27",
				},
				vi_mode_colors = {
					NORMAL = "green",
					OP = "green",
					INSERT = "yellow",
					VISUAL = "purple",
					LINES = "orange",
					BLOCK = "dark_red",
					REPLACE = "red",
					COMMAND = "aqua",
				},
				components = {
					active = {
						{
							{
								provider = "▊",
								hl = {
									fg = "violet",
								},
								right_sep = " ",
							},
							{
								provider = "vi_mode",
								hl = function()
									return {
										name = require("feline.providers.vi_mode").get_mode_highlight_name(),
										fg = require("feline.providers.vi_mode").get_mode_color(),
										style = "bold",
									}
								end,
								icon = "",
								right_sep = " ",
							},
							{
								provider = "file_size",
								right_sep = " ",
							},
							{
								provider = {
									name = "file_info",
									opts = {
										type = "relative-short",
									},
								},
								hl = {
									style = "bold",
								},
								left_sep = " ",
								right_sep = " ",
							},
						},
						{
							{
								provider = "lsp_client_names",
								hl = {
									fg = "yellow",
									style = "bold",
								},
							},
						},
						{
							{
								provider = "git_diff_added",
								hl = {
									fg = "green",
								},
							},
							{
								provider = "git_diff_removed",
								hl = {
									fg = "red",
								},
							},
							{
								provider = "git_diff_changed",
								hl = {
									fg = "orange",
								},
							},
							{
								provider = "git_branch",
								hl = {
									style = "bold",
								},
								left_sep = " ",
							},
							{
								provider = "position",
								left_sep = " ",
							},
							{
								provider = "line_percentage",
								hl = {
									style = "bold",
								},
								left_sep = " ",
							},
							{
								provider = "▊",
								hl = {
									fg = "violet",
								},
								left_sep = " ",
							},
						},
					},
				},
			})
		end,
	},
}
