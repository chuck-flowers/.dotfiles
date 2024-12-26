local arrow = s(
	"function:arrow",
	fmt(
		[[
	({args}) => {{
		{impl}
	}}
]],
		{
			args = i(1),
			impl = i(0),
		}
	)
)
local func = s(
	"function",
	fmt(
		[[
	function {name}({params}) {{
		{impl}
	}}
]],
		{
			name = i(1),
			params = i(2),
			impl = i(0),
		}
	)
)

return {
	arrow,
	func,
}
