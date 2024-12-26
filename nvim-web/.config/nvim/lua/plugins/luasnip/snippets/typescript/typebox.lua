local object = s(
	"typebox:object",
	fmt(
		[[
	Type.Object({{
		{body}
	}})
]],
		{
			body = i(0),
		}
	)
)

local object_static = s(
	"typebox:object:static",
	fmt(
		[[
	type {type_name} = Static<typeof {name_ref}>;
	const {name} = Type.Object({{
		{body}
	}})
]],
		{
			name = i(1),
			body = i(2),
			name_ref = rep(1),
			type_name = f(function(args)
				--- @type string
				local name = args[1][1]

				return name:sub(1, 1):upper() .. name:sub(2)
			end, { 1 }),
		}
	)
)

return {
	object,
	object_static,
}
