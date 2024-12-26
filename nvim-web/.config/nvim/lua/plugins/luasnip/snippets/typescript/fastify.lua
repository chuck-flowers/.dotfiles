local plugin = s(
	"fastify:plugin",
	fmt(
		[[
	import type {{ FastifyPluginAsync }} from 'fastify';
	import fastifyPlugin from 'fastify-plugin';

	const {name}: FastifyPluginAsync = async (app) => {{
		{impl}
	}};

	export default fastifyPlugin({name_ref});

]],
		{
			name = i(1, "myPlugin"),
			name_ref = rep(1),
			impl = i(0, ""),
		}
	)
)

local handler = s(
	"fastify:route",
	fmt(
		[[
	app.{method}('{path}', {{
		schema: {{

		}},
	}}, async (req, res) => {{
		{handler}
		return res.status(200).send();
	}});
]],
		{
			method = c(1, {
				i(nil, "get"),
				i(nil, "post"),
				i(nil, "put"),
				i(nil, "patch"),
				i(nil, "delete"),
			}),
			path = i(2, "/"),
			handler = i(0, ""),
		}
	)
)

return {
	plugin,
	handler,
}
