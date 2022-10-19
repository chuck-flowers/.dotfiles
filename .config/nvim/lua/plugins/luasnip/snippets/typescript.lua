return {
	s('export_function', fmt([[
		export function {name}({params}): {return_type} {{
			{body}
		}}
	]], {
		name = i(1, 'name'),
		params = i(2, ''),
		return_type = i(3, 'void'),
		body = i(0, '')
	})),
	s('export_async_function', fmt([[
		export async function {name}({props}): Promise<{return_type}> {{
			{body}
		}}
	]], {
		name = i(1, 'foo'),
		props = i(2, ''),
		return_type = i(3, 'void'),
		body = i(0, '')
	})),
	s('react_fn_cmp', fmt([[
		export type {props_name} = {{}}
		export function {component_name} (props: {props_name}) {{
			{body}
		}}
	]], {
		props_name = f(function(args)
			local component_name = args[1][1]
			return component_name .. 'Props'
		end, { 1 }),
		component_name = i(1, 'component_name'),
		body = i(0, 'body')
	})),
	s('fn_service', fmt([[
		type {service_name} = ReturnType<typeof {ctor_name}>;
		export default {service_name};

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
	}))
}

