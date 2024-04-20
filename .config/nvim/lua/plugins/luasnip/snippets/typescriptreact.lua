return {
	s('react:cmp:s', fmt([[
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
	})),
	s('react:state', fmt([[
		const [{value}, {setter}] = React.useState({init});
	]], {
		value = i(1, 'value'),
		setter = f(function(args)
			--- @type string
			local name = args[1][1]
			if name:match('^is[A-Z]') then
				name = 'TODO'
			end

			return 'set' .. name:sub(1, 1):upper() .. name:sub(1);
		end, { 1 }),
		init = c(2, {
			i(nil, "''")
		}),
	})),
}
