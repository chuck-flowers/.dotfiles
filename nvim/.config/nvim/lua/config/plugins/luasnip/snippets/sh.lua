return {
	s(
		"header",
		fmt(
			[[
		{leading}
		# {title} #
		{trailing}
	]],
			{
				leading = f(function(args)
					return string.rep("#", string.len(args[1][1]) + 4)
				end, { 1 }),
				title = i(1, "TITLE"),
				trailing = f(function(args)
					return string.rep("#", string.len(args[1][1]) + 4)
				end, { 1 }),
			}
		)
	),
}
