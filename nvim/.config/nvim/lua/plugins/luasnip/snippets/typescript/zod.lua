local object = s(
	"zod:object",
	fmt(
		[[z.object({{
	{object_props}
}})]],
		{
			object_props = i(1, ""),
		}
	)
)

local object_inferred = s(
	"zod:object:infered",
	fmt(
		[[
		type {inferred_type} = z.infer<typeof {schema_name_ref}>;
		const {schema_name} = z.object({{
			{object_props}
		}})
	]],
		{
			inferred_type = f(function(args)
				--- @type string
				local schema_name = args[1][1]
				local upper_first = schema_name:sub(1, 1):upper()
				local remaining = schema_name:sub(2)

				return upper_first .. remaining
			end, { 1 }),
			schema_name = i(1, "schemaName"),
			schema_name_ref = f(function(args)
				return args[1][1]
			end, { 1 }),
			object_props = i(0, ""),
		}
	)
)

return {
	object,
	object_inferred,
}
