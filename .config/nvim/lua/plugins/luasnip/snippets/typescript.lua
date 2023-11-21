return {
	s('iclass', fmt([[
		export interface {iname} {{
			{idef}
		}}

		export default class {cname} implements {iname} {{
			constructor(

			) {{

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
		iname = f(function(args)
			local service_name = args[1][1]
			return 'I' .. service_name
		end, { 1 }),
		idef = i(0, '')
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
	s('fn_service', fmt([[
		type {service_name} = ReturnType<typeof {ctor_name}>;
		export default {exported_service_name};

		export type {config_name} = AppConfigSubset;
		export type {deps_name} = ServiceDeps;

		export function {ctor_name}(config: {config_name}, deps: {deps_name}) {{
			const {{

			}} = deps;

			const service = {{
				{body}
			}};
			
			return service;
		}}
	]], {
		service_name = i(1, 'Foo'),
		exported_service_name = f(function(args)
			local service_name = args[1][1]
			return service_name
		end, { 1 }),
		ctor_name = f(function(args)
			local service_name = args[1][1]
			return 'create' .. service_name
		end, { 1 }),
		config_name = f(function(args)
			local service_name = args[1][1]
			return service_name .. 'Config'
		end, { 1 }),
		deps_name = f(function(args)
			local service_name = args[1][1]
			return service_name .. 'Deps'
		end, { 1 }),
		body = i(0, '')
	})),
	s('jest_test', fmt([[
		it('{test_name}', () => {{
			{body}
		}});
	]], {
		test_name = i(1, 'Test'),
		body = i(0, '')
	}))
}
