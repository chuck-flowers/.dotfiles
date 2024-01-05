return {
	s('react_fn_cmp', fmt([[
		export type {props_name} = {{}}
		export default function {component_name} (props: {props_name}) {{
			{body}
		}}
	]], {
		props_name = f(function(args)
			local component_name = args[1][1]
			return component_name .. 'Props'
		end, { 1 }),
		component_name = d(1, function(args, snip)
			local filename = snip.env.TM_FILENAME
			local component_name = filename:gsub('%..+', '')

			return sn(nil, {
				i(1, component_name)
			})
		end),
		body = i(0, 'return null;')
	}))
}
