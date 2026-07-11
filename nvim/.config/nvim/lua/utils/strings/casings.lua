local M = {}

---@param input string
---@return boolean
function M.is_camel_case(input)
	--- @type string?
	local first_word = input:match('^[a-z]+')
	if not first_word then
		return false
	end

	local count = first_word:len()
	local remaining_words = input:sub(count + 1)
	for word in remaining_words:gmatch('[A-Z][a-z]*') do
		count = count + #word
	end

	return count == #input
end

---@param input string
---@return string[]
function M.tokenize_camel_case(input)
	--- @type string[]
	local tokens = {}

	--- @type string?
	local first_word = input:match('^[a-z]+')
	if not first_word then
		return tokens
	end

	table.insert(tokens, first_word)

	local remaining_words = input:sub(first_word:len() + 1)
	for word in remaining_words:gmatch('[A-Z][a-z]*') do
		table.insert(tokens, word:lower())
	end

	return tokens
end

--- @param input string
--- @return string
function M.to_camel_case(input)
	local tokens = M.tokenize(input)
	if not tokens then
		error('Failed to tokenize: ' .. input)
	end

	return M.as_camel_case(tokens)
end

--- @param input string[]
--- @return string
function M.as_camel_case(input)
	vim.notify('to_camel_case ' .. vim.inspect(input), vim.log.levels.INFO)
	local to_return = input[1]
	for i = 2, #input do
		local token = input[i]
		vim.notify('to_camel_case for ' .. vim.inspect({ i = i, token = token }), vim.log.levels.INFO)
		to_return = to_return .. (token:sub(1, 1):upper()) .. (token:sub(2))
	end

	return to_return
end

---@param input string
function M.is_kebab_case(input)
	return input:find('-') ~= nil
end

--- @param input string[]|string
--- @return string?
function M.to_kebab_case(input)
	if type(input) == "string" then
		local tokens = M.tokenize(input)
		if tokens == nil then
			return nil
		end

		input = tokens
	end

	return table.concat(input, '-')
end

---@param input string
---@return string[]
function M.tokenize_kebab_case(input)
	--- @type string[]
	local to_return = {}

	for token in input:gmatch('[^-]+') do
		table.insert(to_return, token)
	end

	return to_return
end

---@param input string
---@return boolean
function M.is_pascal_case(input)
	return string.match(input, '^([A-Z]+[a-z]*)+$') ~= nil
end

---@param input string
---@return string[]
function M.tokenize_pascal_case(input)
	--- @type string[]
	local to_return = {}

	for match in input:gmatch('[A-Z]+[a-z]*') do
		table.insert(to_return, match)
	end

	return to_return
end

---@return string[]?
function M.tokenize(input)
	if M.is_camel_case(input) then
		return M.tokenize_camel_case(input)
	elseif M.is_pascal_case(input) then
		return M.tokenize_pascal_case(input)
	elseif M.is_kebab_case(input) then
		return M.tokenize_kebab_case(input)
	end
end

--- @param input string[]
--- @return string
function M.to_pascal_case(input)
	error('TODO')
end

return M
