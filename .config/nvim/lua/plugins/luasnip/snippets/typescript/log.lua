local trace = s('log:trace', fmt([[
		{log_call}.debug({log_content});
	]], {
	log_call = c(1, {
		t('this.logger'),
		t('logger'),
		t('console'),
	}),
	log_content = f(function()
		-- Find the first parent method node
		local node = vim.treesitter.get_node()
		while node ~= nil do
			local type = node:type()
			if type == 'method_definition' or type == 'function_declaration' then
				break
			end

			node = node:parent()
		end

		-- If node not found, return empty
		if not node then
			vim.notify 'Not inside a method/function'
			return ''
		end

		local name = ''
		local params = {}
		local query = vim.treesitter.query.get('typescript', 'func-name-and-params')
		for id, capture in query:iter_captures(node, 0) do
			local cap_name = query.captures[id]
			if cap_name == 'name' then
				name = vim.treesitter.get_node_text(capture, 0)
			elseif cap_name == 'params' then
				local param = vim.treesitter.get_node_text(capture, 0)
				table.insert(params, param)
			end
		end

		if (#params > 0) then
			return "'" .. name .. "', { " .. table.concat(params, ', ') .. " }"
		else
			return "'" .. name .. "'"
		end
	end, {}),
}))

return {
	trace
}
