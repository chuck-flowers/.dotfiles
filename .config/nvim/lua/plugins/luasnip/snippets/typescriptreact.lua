return {
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
	}))
}
