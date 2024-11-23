local construct = s(
	"cdk:construct",
	fmt(
		[[
import {{ Construct }} from 'constructs';

export class {name} extends Construct {{
	constructor(scope: Construct, id: string, props: {props_ref}) {{
		super(scope, id);

		{ctor_body}
	}}
}}

type {props_name} = {{
	{props_body}
}}
]],
		{
			name = d(1, function(args, snip)
				local filename = snip.env.TM_FILENAME
				local class_name = filename:gsub("%..+", "")

				return sn(nil, {
					i(1, class_name),
				})
			end),
			props_name = f(function(args)
				local class_name = args[1][1]
				return class_name .. "Props"
			end, { 1 }, { key = "props_name" }),
			props_ref = extras.rep(k("props_name")),
			props_body = i(2, ""),
			ctor_body = i(3, ""),
		}
	)
)

return {
	construct,
}
