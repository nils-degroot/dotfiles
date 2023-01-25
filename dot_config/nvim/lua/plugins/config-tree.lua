return function()
	require("nvim-tree").setup({
		update_focused_file = {
			update_root = true,
		},
		modified = {
			enable = true,
		},
		view = {
			side = "right",
			float = {
				enable = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local window_w = screen_w * 0.8
					local window_h = screen_h * 0.5

					return {
						border = "rounded",
						relative = "editor",
						row = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get(),
						col = (screen_w - window_w) / 2,
						width = math.floor(window_w),
						height = math.floor(window_h),
					}
				end,
			},
		},
		renderer = {
			add_trailing = true,
			group_empty = true,
			highlight_opened_files = "name",
			indent_markers = {
				enable = true,
			},
		},
		trash = {
			cmd = "rip",
		},
	})
end
