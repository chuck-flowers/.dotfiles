local plugin = s('fastify:plugin', fmt([[
	import type {{ FastifyPluginAsync }} from 'fastify';
	import fastifyPlugin from 'fastify-plugin';

	const {name}: FastifyPluginAsync = async (app) => {{
		{impl}
	}};

	export default fastifyPlugin({name_ref});

]], {
	name = i(1, 'myPlugin'),
	name_ref = rep(1),
	impl = i(0, ''),
}))

return {
	plugin,
}
