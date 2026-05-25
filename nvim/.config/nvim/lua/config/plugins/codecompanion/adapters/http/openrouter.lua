return function()
	return require('codecompanion.adapters').extend('openai_compatible', {
		env = {
			url = 'https://openrouter.ai/api',
			api_key = 'OPENROUTER_API_KEY',
			chat_url = '/v1/chat/completions',
		},
		schema = {
			model = {
				-- default = 'openai/gpt-5.5',
				-- default = 'openrouter/owl-alpha',
				default = 'openai/gpt-oss-20b:free',
			},
		},
	})
end
