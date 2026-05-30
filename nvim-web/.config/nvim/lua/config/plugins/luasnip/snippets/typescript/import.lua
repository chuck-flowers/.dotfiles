--- @param import_path string
local function extract_alias(import_path)
	--- @type string[]
	local segs = {}
	for seg in import_path:gmatch("[^/]+") do
		table.insert(segs, seg)
	end

	if #segs == 0 then
		return ""
	end

	local last_seg = segs[#segs]

	-- Handle a standard file
	local file_stem = last_seg:match("^([^.]+)(%..+)+$")
	if file_stem then
		return file_stem
	end

	-- Handle node:* style imports
	local _, builtin_suffix = last_seg:match("^(%w+)%:(%w+)$")
	if builtin_suffix then
		return builtin_suffix
	end

	return last_seg
end

local import = s(
	"import",
	fmt(
		[[
	import {members} from '{source}';
]],
		{
			source = i(1, "", { key = "source" }),
			members = c(2, {
				-- Default
				d(nil, function(args)
					local alias = extract_alias(args[1][1])
					return sn(nil, fmt("{alias}", { alias = i(1, alias) }))
				end, k("source")),
				-- Named
				sn(
					nil,
					fmt("{{ {imports} }}", {
						imports = i(1, ""),
					})
				),
				-- Namespace
				d(nil, function(args)
					local alias = extract_alias(args[1][1])
					return sn(nil, fmt("* as {alias}", { alias = i(1, alias) }))
				end, k("source")),
			}),
		}
	)
)

return {
	import,
}
