return {
	s('iclass', fmt([[
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
	s('sclass', fmt([[
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
	s('eclass', fmt([[
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
	s('vitest', fmt([[
		it('{test_name}', () => {{
			{body}
		}});
	]], {
		test_name = i(1, 'Test'),
		body = i(0, '')
	}))
}
