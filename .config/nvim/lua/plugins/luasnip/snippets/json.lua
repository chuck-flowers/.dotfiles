return {
	s('env_config_schema', fmt([[
		{{
			"$schema": "http://json-schema.org/draft-07/schema#",
			"properties": {{
				"NODE_ENV": {{
					"type": "string",
					"enum": [
						"production",
						"staging",
						"development",
						"local"
					],
					"default": "local"
				}}
			}},
			"required": [
				"NODE_ENV"
			]
		}}
	]], {}))
}
