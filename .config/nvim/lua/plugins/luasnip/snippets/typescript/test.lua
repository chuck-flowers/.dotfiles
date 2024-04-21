local node = s('test:node', fmt([[
		test('{test_name}', () => {{
			{body}
		}})
	]], {
	test_name = i(1, 'Test'),
	body = i(0, ''),
}))

local vitest = s('test:vitest', fmt([[
		it('{test_name}', () => {{
			{body}
		}});
	]], {
	test_name = i(1, 'Test'),
	body = i(0, '')
}))

return {
	node,
	vitest,
}
