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

	if nvim_lsp ~= nil then
		nvim_lsp.bashls.setup{
		}
		nvim_lsp.dockerls.setup{
		}
		nvim_lsp.pylsp.setup{
		}
		nvim_lsp.rust_analyzer.setup{
		}
	end
end)
EOF

" KEY BINDINGS
let mapleader=" "

" Configure fugitive
nnoremap <leader>Gs <cmd>Git<cr>
nnoremap <leader>Gc <cmd>Git commit<cr>
nnoremap <leader>Gl <cmd>Git l<cr>

" Configure telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Configure nvim-cmp
lua << EOF
pcall(function ()
	local cmp = require('cmp')

	if cmp ~= nil then
		cmp.setup {
			mapping = {},
			formatting = {},
			sources = {
				{ name = "nvim_lsp" }
			}
		}
	end
end)
EOF

" FILE CONFIGURATIONS

" YAML Configuration
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

