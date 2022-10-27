return {
	s('require', fmt([[
		local {module} = require '{path}'
	]], {
		module = f(function(args)
			print ('module fnode: args = ' .. vim.inspect(args))
			local path = args[1][1]

			print('Calculating module name: path = ' .. path)
			local components = vim.split(path, '.', { plain = true })
			print('components = ' .. vim.inspect(components))
			return components[#components]
		end, { 1 }),
		path = i(1, '')
	}))
}
