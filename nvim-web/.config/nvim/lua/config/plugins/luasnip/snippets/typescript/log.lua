--- @return nil | { name: string, params: string[] }
local function get_function_context()
	-- Find the first parent method node
	local node = vim.treesitter.get_node()
	while node ~= nil do
		local type = node:type()
		if type == "method_definition" or type == "function_declaration" then
			break
		end

		node = node:parent()
	end

	-- If node not found, return empty
	if not node then
		vim.notify("Not inside a method/function")
		return nil
	end

	local name = ""

	--- @type string[]
	local params = {}

	local query = vim.treesitter.query.get("typescript", "func-name-and-params")
	if not query then
		vim.notify('Unable to get/execute query func-name-and-params', vim.log.levels.ERROR)
		return nil
	end

	for id, capture in query:iter_captures(node, 0) do
		local cap_name = query.captures[id]
		if cap_name == "name" then
			name = vim.treesitter.get_node_text(capture, 0)
		elseif cap_name == "params" then
			local param = vim.treesitter.get_node_text(capture, 0)
			table.insert(params, param)
		end
	end

	return {
		name = name,
		params = params,
	}
end

local pino_fn_trace = s(
	"pino:fn:trace",
	fmt('{log_call}.{log_level}({log_content});', {
		log_call = c(1, {
			t("this.logger"),
			t("logger"),
		}),
		log_level = c(2, {
			t("trace"),
			t("debug"),
			t("info"),
			t("warn"),
			t("error"),
			t("fatal"),
		}),
		log_content = f(function()
			local context = get_function_context()
			if not context then
				return ''
			end

			local name = context.name
			local params = context.params

			local fmt_str_params = {}
			for _, _ in ipairs(params) do
				table.insert(fmt_str_params, '%s')
			end


			local fmt_str = '%s(' .. table.concat(fmt_str_params, ', ') .. ')'
			local fn_name_ref = string.format('this.%s.name', name)

			local to_return = string.format("'%s', %s", fmt_str, fn_name_ref)
			if #params > 0 then
				to_return = to_return .. ', ' .. table.concat(params, ', ')
			end

			return to_return
		end, {}),
	}
	)
)

return {
	pino_fn_trace,
}
