return {
	s('class:error', fmt([[
		class {ename} extends Error {{
			constructor({ctor_args}) {{
				super({super_ctor_args});
				{ctor_impl}
			}}
			{message_impl}
		}}
	]], {
		ename = i(1, 'CustomError'),
		ctor_args = i(2, ''),
		super_ctor_args = i(3, ''),
		ctor_impl = i(4, ''),
		message_impl = c(5, {
			d(nil, function()
				return sn(nil, fmt([[

					get message(): string {{
						return `{message_string}`;
					}}
				]], {
					message_string = i(1, ''),
				}))
			end),
			i(nil, '')
		})
	})),
	s('class:interface', fmt([[
		export type {iname} = Pick<{ref_cname}, keyof {ref_cname}>;

		export default class {cname} implements {iname} {{
			{class_fields}

			constructor(
				{ctor_args}
			) {{
				{ctor_impl}
			}}

			{class_methods}
		}}
	]], {
		cname = d(1, function(args, snip)
			local filename = snip.env.TM_FILENAME
			local class_name = filename:gsub('%..+', '')

			return sn(nil, {
				i(1, class_name)
			})
		end),
		iname = f(function(args)
			local service_name = args[1][1]
			return 'I' .. service_name
		end, { 1 }),
		ref_cname = f(function(args) return args[1][1] end, { 1 }),
		ctor_args = i(2, ''),
		class_fields = i(3, ''),
		ctor_impl = i(4, ''),
		class_methods = i(5, ''),
	})),
	s('class:sub', fmt([[
		class {cname} extends {pname} {{
			constructor() {{
				{ctor}
			}}
		}}
	]], {
		cname = d(1, function(args, snip)
			local filename = snip.env.TM_FILENAME
			local class_name = filename:gsub('%..+', '')

			return sn(nil, {
				i(1, class_name)
			})
		end),
		pname = i(2, 'Parent'),
		ctor = i(0, ''),
	})),
	s('error:todo', fmt([[
		throw new Error('Not implemented')
	]], {})),
	s('log:trace', fmt([[
		this.logger.debug({log_content});
	]], {
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

			return "'" .. name .. "', { " .. table.concat(params, ', ') .. " }"
		end, {}),
	})),
	s('test:node', fmt([[
		test('{test_name}', () => {{
			{body}
		}})
	]], {
		test_name = i(1, 'Test'),
		body = i(0, ''),
	})),
	s('test:vitest', fmt([[
		it('{test_name}', () => {{
			{body}
		}});
	]], {
		test_name = i(1, 'Test'),
		body = i(0, '')
	})),
	s('zod:object:infered', fmt([[
		type {inferred_type} = z.infer<typeof {schema_name_ref}>;
		const {schema_name} = z.object({{
			{object_props}
		}})
	]], {
		inferred_type = f(function(args)
			--- @type string
			local schema_name = args[1][1]
			local upper_first = schema_name:sub(1, 1):upper()
			local remaining = schema_name:sub(2)

			return upper_first .. remaining
		end, { 1 }),
		schema_name = i(1, 'schemaName'),
		schema_name_ref = f(function(args) return args[1][1] end, { 1 }),
		object_props = i(0, ''),
	})),
}
