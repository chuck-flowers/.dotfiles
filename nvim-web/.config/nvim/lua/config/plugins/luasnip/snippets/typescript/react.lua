local component_func = s(
	"react:component",
	fmt(
		[[
		export interface {props_name} {{
			{props_body}
		}}

		export default function {component_name}(props: {props_name}) {{
			{component_body}
		}}
	]],
		{
			props_name = f(function(args)
				local component_name = args[1][1]
				return component_name .. "Props"
			end, { 2 }),
			component_name = d(2, function(args, snip)
				local filename = snip.env.TM_FILENAME
				local component_name = filename:gsub("%..+", "")

				return sn(nil, {
					i(1, component_name),
				})
			end),
			props_body = i(1, ''),
			component_body = i(0, "return null;"),
		}
	)
)

local context = s(
	"react:context",
	fmt(
		[[
	import React from 'react';

	const {context_name} = React.createContext<{value_type_name} | null>(null);
	{context_name_ref}.displayName = '{context_name_ref}';

	type {value_type_name} = {{
		{value_props}
	}};

	export default function {provider_name}(props: {provider_props_name}) {{
		const [value, setValue] = React.useState<{value_type_name}>();

		return <{context_name_ref}.Provider value={{value}}>
			{{props.children}}
		</{context_name_ref}.Provider>
	}}

	type {provider_props_name} = {{
		{provider_props_content}
		children: React.ReactNode
	}}
]],
		{
			context_name = d(1, function(args, snip)
				local filename = snip.env.TM_FILENAME
				local context_name = filename:gsub("%..+", "")

				return sn(nil, {
					i(1, context_name),
				})
			end),
			context_name_ref = rep(1),
			value_type_name = f(function(args, snip)
				local value_type_name = args[1][1]
				value_type_name = value_type_name:gsub("Context", "Value")

				return value_type_name
			end, { 1 }),
			value_props = i(2),
			provider_name = f(function(args)
				local provider_name = args[1][1]
				provider_name = provider_name:gsub("Context", "Provider")

				return provider_name
			end, { 1 }),
			provider_props_name = f(function(args)
				local provider_props_name = args[1][1]
				provider_props_name = provider_props_name:gsub("Context", "ProviderProps")

				return provider_props_name
			end, { 1 }),
			provider_props_content = i(3),
		}
	)
)

local effect = s(
	"react:effect",
	fmt(
		[[
	React.useEffect(() => {{
		{impl}
		return;
	}}, [{deps}]);
]],
		{
			deps = i(1),
			impl = i(0),
		}
	)
)

local memo = s(
	"react:memo",
	fmt(
		[[
	const {name} = React.useMemo(() => {{
		{impl}
	}}, [{deps}]);
]],
		{
			name = i(1),
			deps = i(2),
			impl = i(3),
		}
	)
)

local state = s(
	"react:state",
	fmt(
		[[
		const [{value}, {setter}] = React.useState({init});
	]],
		{
			value = i(1, "value"),
			setter = f(function(args)
				--- @type string
				local name = args[1][1]
				if name:match("^is[A-Z]") then
					name = name:sub(3)
				end

				return "set" .. name:sub(1, 1):upper() .. name:sub(2)
			end, { 1 }),
			init = c(2, {
				i(nil, "''"),
				sn(
					nil,
					fmt(
						[[
			() => {{
				{body}
			}}
		]],
						{
							body = i(1, "return '';"),
						}
					)
				),
			}),
		}
	)
)

return {
	component_func,
	context,
	effect,
	memo,
	state,
}
