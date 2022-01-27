" Show line numbers
set number
set relativenumber

" Enable syntax highlighting
syntax on

" Configure color scheme
set background=dark
colorscheme gruvbox

" Configure tabbing behavior
set tabstop=4
set autoindent
set softtabstop=4
set shiftwidth=4

" Configure the line wrapping behavior
set nowrap

lua << EOF
pcall(function ()
	local nvim_lsp = require('lspconfig')

	local function on_attach(client, bufnr)
		local opts = { noremap=true, silent=true }

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	end

	if nvim_lsp ~= nil then
		local servers = {
			'bashls',
			'clangd',
			'dockerls',
			'pylsp',
			'rust_analyzer',
			'tsserver'
		}

		for _, lsp in ipairs(servers) do
			nvim_lsp[lsp].setup {
				on_attach = on_attach
			}
		end
	end
end)
EOF

" KEY BINDINGS
let mapleader=" "

" Configure dashboard
let g:dashboard_default_executive = 'telescope'

" Configure fugitive
nnoremap <leader>Gs <cmd>Git<cr>
nnoremap <leader>Gc <cmd>Git commit<cr>
nnoremap <leader>Gl <cmd>Git l<cr>

" Configure nerdtree
nnoremap <leader>N <cmd>NERDTreeToggle<cr>

" Configure telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope git_branches<cr>

" Configure vimwiki
let wiki = {}
let wiki.diary_rel_path = "journal/"
let wiki.diary_index = "journal"
let wiki.diary_header = "Journal"
let wiki.auto_export = 1
let g:vimwiki_list = [wiki]

" Configure nvim-cmp
lua << EOF
pcall(function ()
	local cmp = require('cmp')

	if cmp ~= nil then
		cmp.setup {
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true
				}
			},
			formatting = {},
			sources = {
				{ name = 'nvim_lsp' }
			}
		}
	end
end)
EOF

" FILE CONFIGURATIONS

" YAML Configuration
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

