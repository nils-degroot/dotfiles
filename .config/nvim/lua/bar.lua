local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function left()
	local function mode()
		local current_mode = vim.api.nvim_get_mode().mode
		local mode_color = "%#StatusLineAccent#"

		if current_mode == "i" or current_mode == "ic" then
			mode_color = "%#SrceryGreen#"
		elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
			mode_color = "%#SrceryYellow#"
		end

		return mode_color .. " " .. modes[current_mode] .. " "
	end

	local function lsp_diagnostics()
		local function severity_count(severity, group)
			local count = vim.tbl_count(vim.diagnostic.get(0, { severity = severity }))
			if count == 0 then
				return ""
			end

			return group .. count
		end

		local base = severity_count(vim.diagnostic.severity.ERROR, " %#DiagnosticError#  ")
			.. severity_count(vim.diagnostic.severity.WARN, "%#DiagnosticWarn#   ")
			.. severity_count(vim.diagnostic.severity.HINT, " %#DiagnosticHint#  ")
			.. severity_count(vim.diagnostic.severity.INFO, " %#DiagnosticInfo#  ")

		if base == "" then
			return ""
		end

		return base .. " %#Normal#"
	end

	return mode()
		.. lsp_diagnostics()
end

local function center()
	local function path()
		local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
		if fpath == "" or fpath == "." then
			return " "
		end

		return string.format(" %%<%s/", fpath)
	end

	return require("mini.icons").get("filetype", vim.bo.filetype)
		.. path()
		.. "%t %m %r %h"
end

local function right()
	local function line_info()
		if vim.bo.filetype == "alpha" then
			return ""
		end

		return " %l:%c "
	end

	local function lsp_attached()
		local result = ""

		for _, client in pairs(vim.lsp.get_clients()) do
			if client.initialized then
				result = result .. " " .. client.name
			end
		end

		return result
	end

	return lsp_attached()
		.. line_info()
end

Statusline = {
	active = function()
		return "%#Statusline#"
			.. left()
			.. "%#Normal#%="
			.. center()
			.. "%=%#StatusLineExtra#"
			.. right()
	end,
	inactive = function()
		return "%="
			.. center()
			.. "%="
	end
}

vim.api.nvim_exec2([[
  augroup Statusline
  au!
	  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
	  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], {})
