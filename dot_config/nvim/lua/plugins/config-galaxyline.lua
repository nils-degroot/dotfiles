return function()
	local status_ok, galaxyline = pcall(require, "galaxyline")
	if not status_ok then
		return
	end

	local colors = {
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
	}

	local condition = require("galaxyline.condition")
	local gls = galaxyline.section
	galaxyline.short_line_list = { "NvimTree", "vista", "dbui", "packer", "lspsagaoutline" }

	gls.left[1] = {
		RainbowRed = {
			provider = function()
				return "▊ "
			end,
			highlight = { colors.violet, colors.bg },
		},
	}

	gls.left[2] = {
		ViMode = {
			provider = function()
				-- auto change color according the vim mode
				local mode_color = {
					["!"] = colors.red,
					[""] = colors.blue,
					[""] = colors.orange,
					["r?"] = colors.cyan,
					c = colors.magenta,
					ce = colors.red,
					cv = colors.red,
					i = colors.green,
					ic = colors.yellow,
					n = colors.red,
					no = colors.red,
					r = colors.cyan,
					R = colors.violet,
					rm = colors.cyan,
					Rv = colors.violet,
					s = colors.orange,
					S = colors.orange,
					t = colors.red,
					v = colors.blue,
					V = colors.blue,
				}
				vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
				return "  "
			end,
		},
	}

	gls.left[3] = {
		FileSize = {
			condition = condition.buffer_not_empty,
			highlight = { colors.fg, colors.bg },
			provider = "FileSize",
		},
	}

	gls.left[4] = {
		FileIcon = {
			condition = condition.buffer_not_empty,
			highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
			provider = "FileIcon",
		},
	}

	gls.left[5] = {
		FileName = {
			condition = condition.buffer_not_empty,
			highlight = { colors.fg, colors.bg, "bold" },
			provider = "FileName",
		},
	}

	gls.left[6] = {
		DiagnosticError = {
			highlight = { colors.red, colors.bg },
			icon = "  ",
			provider = "DiagnosticError",
		},
	}

	gls.left[7] = {
		DiagnosticWarn = {
			highlight = { colors.yellow, colors.bg },
			icon = "  ",
			provider = "DiagnosticWarn",
		},
	}

	gls.left[8] = {
		DiagnosticHint = {
			highlight = { colors.cyan, colors.bg },
			icon = "  ",
			provider = "DiagnosticHint",
		},
	}

	gls.left[9] = {
		DiagnosticInfo = {
			highlight = { colors.blue, colors.bg },
			icon = "  ",
			provider = "DiagnosticInfo",
		},
	}

	gls.mid[1] = {
		ShowLspClient = {
			condition = function()
				local client_count = #vim.lsp.buf_get_clients()
				if client_count == 0 then
					return false
				end

				return true
			end,
			highlight = { colors.yellow, colors.bg, "bold" },
			icon = " LSP:",
			provider = "GetLspClient",
		},
	}

	gls.right[1] = {
		LineInfo = {
			highlight = { colors.fg, colors.bg },
			provider = "LineColumn",
			separator = " ",
			separator_highlight = { "NONE", colors.bg },
		},
	}

	gls.right[2] = {
		PerCent = {
			highlight = { colors.fg, colors.bg, "bold" },
			provider = "LinePercent",
			separator = " ",
			separator_highlight = { "NONE", colors.bg },
		},
	}

	gls.right[3] = {
		GitIcon = {
			provider = function()
				return "  "
			end,
			condition = condition.check_git_workspace,
			highlight = { colors.violet, colors.bg, "bold" },
			separator = " ",
			separator_highlight = { "NONE", colors.bg },
		},
	}

	gls.right[4] = {
		GitBranch = {
			condition = condition.check_git_workspace,
			highlight = { colors.violet, colors.bg, "bold" },
			provider = "GitBranch",
		},
	}

	gls.right[5] = {
		Separator = {
			highlight = { colors.fg, colors.bg, "bold" },
			provider = function()
				return " "
			end,
		},
	}

	gls.right[6] = {
		DiffAdd = {
			condition = condition.hide_in_width,
			highlight = { colors.green, colors.bg },
			icon = "  ",
			provider = "DiffAdd",
		},
	}

	gls.right[7] = {
		DiffModified = {
			condition = condition.hide_in_width,
			highlight = { colors.orange, colors.bg },
			icon = " 柳",
			provider = "DiffModified",
		},
	}

	gls.right[8] = {
		DiffRemove = {
			condition = condition.hide_in_width,
			highlight = { colors.red, colors.bg },
			icon = "  ",
			provider = "DiffRemove",
		},
	}

	gls.right[9] = {
		RainbowBlue = {
			provider = function()
				return " ▊"
			end,
			highlight = { colors.violet, colors.bg },
		},
	}

	gls.short_line_left[1] = {
		BufferType = {
			highlight = { colors.blue, colors.bg, "bold" },
			provider = "FileTypeName",
			separator = " ",
			separator_highlight = { "NONE", colors.bg },
		},
	}

	gls.short_line_left[2] = {
		SFileName = {
			condition = condition.buffer_not_empty,
			highlight = { colors.fg, colors.bg, "bold" },
			provider = "SFileName",
		},
	}

	gls.short_line_right[1] = {
		BufferIcon = {
			highlight = { colors.fg, colors.bg },
			provider = "BufferIcon",
		},
	}
end