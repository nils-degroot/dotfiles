local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local COMPLETION = methods.internal.COMPLETION

local NAME_REGEX = "\\%([^/\\\\:\\*?<>'\"`\\|]\\)"
local PATH_REGEX =
	vim.regex(([[\%(\%(/PAT*[^/\\\\:\\*?<>\'"`\\| .~]\)\|\%(/\.\.\)\)*/\zePAT*$]]):gsub("PAT", NAME_REGEX))

local MAX_PREVIEW_LINES = 20

local function resolve_dirname(line_to_cursor, bufnr)
	local s = PATH_REGEX:match_str(line_to_cursor)
	if not s then
		return nil
	end

	local dirname = string.gsub(string.sub(line_to_cursor, s + 2), "%a*$", "")
	local prefix = string.sub(line_to_cursor, 1, s + 1)

	local buf_dirname = vim.fn.expand(("#%d:p:h"):format(bufnr))

	if prefix:match("%.%./$") then
		return vim.fn.resolve(buf_dirname .. "/../" .. dirname)
	end
	if prefix:match("%./$") or prefix:match('"$') or prefix:match("'$") then
		return vim.fn.resolve(buf_dirname .. "/" .. dirname)
	end
	if prefix:match("~/$") then
		return vim.fn.resolve(vim.fn.expand("~") .. "/" .. dirname)
	end

	local env_var_name = prefix:match("%$([%a_]+)/$")
	if env_var_name then
		local env_var_value = vim.fn.getenv(env_var_name)
		if env_var_value ~= vim.NIL then
			return vim.fn.resolve(env_var_value .. "/" .. dirname)
		end
	end

	if prefix:match("/$") then
		local accept = true
		-- Ignore URL components
		accept = accept and not prefix:match("%a/$")
		-- Ignore URL scheme
		accept = accept and not prefix:match("%a+:/$") and not prefix:match("%a+://$")
		-- Ignore HTML closing tags
		accept = accept and not prefix:match("</$")
		-- Ignore math expressions (e.g. `4 /`)
		accept = accept and not prefix:match("[%d%)]%s*/$")
		-- Ignore `/` or `//` comment prefixes
		local commentstring = vim.bo[bufnr].commentstring or ""
		local no_filetype = vim.bo[bufnr].filetype == ""
		local is_slash_comment = commentstring:match("/%*") or commentstring:match("//")
		if is_slash_comment and not no_filetype then
			accept = accept and not prefix:match("^[%s/]*$")
		end
		if accept then
			return vim.fn.resolve("/" .. dirname)
		end
	end

	return nil
end

local function get_candidates(dirname, include_hidden)
	local fs, err = vim.loop.fs_scandir(dirname)
	if err then
		return nil
	end

	local items = {}

	while true do
		local name, fs_type, e = vim.loop.fs_scandir_next(fs)
		if e then
			break
		end
		if not name then
			break
		end

		if include_hidden or string.sub(name, 1, 1) ~= "." then
			local path = dirname .. "/" .. name
			local stat = vim.loop.fs_stat(path)
			if stat then
				fs_type = stat.type
			elseif fs_type == "link" then
				-- Broken symlink -- skip
				local lstat = vim.loop.fs_lstat(path)
				if not lstat then
					goto continue
				end
			else
				goto continue
			end

			local kind = vim.lsp.protocol.CompletionItemKind.File
			local label = name
			local insert_text = name

			if fs_type == "directory" then
				kind = vim.lsp.protocol.CompletionItemKind.Folder
				label = name .. "/"
				insert_text = name .. "/"
			end

			table.insert(items, {
				label = label,
				kind = kind,
				insertText = insert_text,
				filterText = name,
				data = {
					path = path,
					type = fs_type,
					stat = stat,
				},
			})
		end

		::continue::
	end

	return items
end

local function get_documentation(filepath)
	local binary = io.open(filepath, "rb")
	if not binary then
		return nil
	end

	local first_kb = binary:read(1024)
	binary:close()
	if not first_kb then
		return nil
	end

	if first_kb:find("\0") then
		return { kind = "plaintext", value = "binary file" }
	end

	local contents = {}
	for line in first_kb:gmatch("[^\r\n]+") do
		table.insert(contents, line)
		if #contents >= MAX_PREVIEW_LINES then
			break
		end
	end

	local filetype = vim.filetype.match({ filename = filepath })
	if not filetype then
		return { kind = "plaintext", value = table.concat(contents, "\n") }
	end

	table.insert(contents, 1, "```" .. filetype)
	table.insert(contents, "```")
	return { kind = "markdown", value = table.concat(contents, "\n") }
end

-- # none-ls Source Definition

return h.make_builtin({
	name = "path",
	meta = {
		description = "Filesystem path completion source.",
	},
	method = COMPLETION,
	filetypes = {},
	generator = {
		---@param params table none-ls params
		---@param done fun(results: table[])
		fn = function(params, done)
			local line = params.content[params.row]
			local line_to_cursor = line:sub(1, params.col)

			local dirname = resolve_dirname(line_to_cursor, params.bufnr)
			if not dirname then
				return done({ { items = {}, isIncomplete = false } })
			end

			-- Include hidden files when the character at the start of the
			-- completion keyword is a dot.
			local keyword_start = vim.regex("\\k*$"):match_str(line_to_cursor)
			local include_hidden = line_to_cursor:sub(keyword_start + 1, keyword_start + 1) == "."

			local items = get_candidates(dirname, include_hidden)
			if not items then
				return done({ { items = {}, isIncomplete = false } })
			end

			-- Attach file preview documentation to file items.
			for _, item in ipairs(items) do
				if item.data and item.data.type == "file" and item.data.stat then
					local doc = get_documentation(item.data.path)
					if doc then
						item.documentation = doc
					end
				end
			end

			done({ { items = items, isIncomplete = false } })
		end,
		async = true,
	},
})
