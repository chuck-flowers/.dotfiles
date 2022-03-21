return {
	'vimwiki/vimwiki',
	config = function()
		vim.g.vimwiki_list = {
			{
				diary_rel_path = 'journal/',
				diary_index = "journal",
				diary_header = "Journal",
				auto_export = 1
			}
		}
	end
}

