local M = {}

M.string_pad = function(input, size)
	if string.len(input) >= size then
		return input
	end

	for _ = 1, (size - string.len(input)) do
		input = input .. " "
	end

	return input
end

M.dump = function(o)
	print(vim.inspect(o))
end

return M
