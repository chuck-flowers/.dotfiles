local func = s('function', fmt([[
	function {name}({params}) {{
		{impl}
	}}
]], {
	name = i(1),
	params = i(2),
	impl = i(0),
}))

return {
	func
}

