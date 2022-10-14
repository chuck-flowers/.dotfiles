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

local react_fn_cmp = fmt('export type {propsName} = {{\n\n}};\n\nexport function {componentName}(props: {propsName}) {{\n\t{body}\n}}', {
	propsName = f(function (args)
		local component_name = args[1][1]
		return component_name .. 'Props'
	end, { 1 }),
	componentName = i(1, 'component_name'),
	body = i(0, 'body')
})

return {
	s('export_function', export_function),
	s('export_async_function', export_async_function),
	s('react_fn_cmp', react_fn_cmp)
}

