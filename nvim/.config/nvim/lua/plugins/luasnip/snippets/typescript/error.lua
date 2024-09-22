local todo = s('error:todo', fmt([[
	throw new Error('TODO: {message}')
]], {
	message = i(1, 'Not implemented')
}));

return {
	todo,
}
