vim.lsp.enable('yamlls')
vim.lsp.config('yamlls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
	settings = {
		yaml = {
			completion = true,
			customTags = {
				"!FindInMap sequence",
				"!GetAtt scalar",
				"!Join sequence",
				"!Ref scalar",
				"!Sub scalar",
			},
			schemas = {
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
				"docker-compose*.yml",
				["https://json.schemastore.org/chart.json"] = "Chart.yaml",
				["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] =
				"*.cf.yml",
				kubernetes = "*.k8s.yml",
				["https://json.schemastore.org/prometheus.json"] = "prometheus.yml",
			},
		},
	},
})
