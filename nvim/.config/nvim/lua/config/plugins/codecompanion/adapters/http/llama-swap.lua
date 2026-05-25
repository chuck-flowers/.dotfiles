return function()
	return require('codecompanion.adapters').extend('openai_compatible', {
		env = {
			url = 'http://sherlock:12434',
			api_key = 'TERM',
			chat_url = '/v1/chat/completions',
		}
	})
end
