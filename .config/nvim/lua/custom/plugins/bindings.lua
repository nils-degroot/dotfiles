return {
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").add({
				-- Code actions
				{ "<Tab>", "<CMD>FzfLua lsp_code_actions<CR>", desc = "Code actions" },
				{ "-", "<CMD>Oil<CR>", desc = "Open oil" },

				-- Project
				{ "<Leader>pf", "<CMD>FzfLua files<CR>", desc = "Find file" },

				-- Toggle
				{ "<Leader>th", "<CMD>set invlist<CR>", desc = "Show hidden characters" },

				-- Code
				{ "<Leader>cr", "<CMD>Lspsaga rename<CR>", desc = "Rename element" },
				{ "<Leader>cc", "<CMD>noh<CR>", desc = "Clear selection" },
				{ "<Leader>cd", "<CMD>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
				{ "<Leader>cw", "<CMD>FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics" },
				{ "<Leader>cf", "<CMD>FzfLua live_grep<CR>", desc = "Live grep" },

				-- Goto
				{ "<Leader>gd", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "Goto definition" },
				{ "<Leader>gr", "<CMD>FzfLua lsp_references<CR>", desc = "Find references" },

				-- Show
				{ "<Leader>sd", "<CMD>Lspsaga peek_definition<CR>", desc = "Show definition" },
				{ "<Leader>ss", "<CMD>Lspsaga hover_doc<CR>", desc = "Show doc" },
				{ "<Leader>sc", "<CMD>FzfLua git_status<CR>", desc = "Show changes" },

				-- Buffer
				{ "<Leader>bb", "<CMD>FzfLua buffers<CR>", desc = "Buffers" },

				-- Movement
				--- Resize
				{ "<A-h>", "<CMD>SmartResizeLeft<CR>", desc = "Resize left" },
				{ "<A-j>", "<CMD>SmartResizeDown<CR>", desc = "Resize down" },
				{ "<A-k>", "<CMD>SmartResizeUp<CR>", desc = "Resize up" },
				{ "<A-l>", "<CMD>SmartResizeRight<CR>", desc = "Resize right" },

				--- Move cursor
				{ "<C-h>", "<CMD>SmartCursorMoveLeft<CR>", desc = "Cursor move left" },
				{ "<C-j>", "<CMD>SmartCursorMoveDown<CR>", desc = "Cursor move down" },
				{ "<C-k>", "<CMD>SmartCursorMoveUp<CR>", desc = "Cursor move up" },
				{ "<C-l>", "<CMD>SmartCursorMoveRight<CR>", desc = "Cursor move right" },

				--- Swap buf
				{ "<Leader><Leader>h", "<CMD>SmartSwapLeft<CR>", desc = "Swap left" },
				{ "<Leader><Leader>j", "<CMD>SmartSwapDown<CR>", desc = "Swap down" },
				{ "<Leader><Leader>k", "<CMD>SmartSwapUp<CR>", desc = "Swap up" },
				{ "<Leader><Leader>l", "<CMD>SmartSwapRight<CR>", desc = "Swap right" },

				-- Move selection
				{
					mode = "v",
					{ "<", "<gv", desc = "Move selection left" },
					{ ">", ">gv", desc = "Move selection right" },
				},
			})
		end,
	},
}
