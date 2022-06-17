local export_function = fmt('export function {}({}): {} {{\n\t{}\n}}', {
	i(1, 'name'),
	i(2, 'params'),
	i(3, 'return_type'),
	i(0, 'body')
})

local export_async_function = fmt('export async function {}({}): Promise<{}> {{\n\t{}\n}}', {
	i(1, 'name'),
	i(2, 'params'),
	i(3, 'return_type'),
	i(0, 'body')
})

return {
	s('export_function', export_function),
	s('export_async_function', export_async_function)
}

