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
local nvim_lsp = require('lspconfig')

nvim_lsp.bashls.setup{
}
nvim_lsp.dockerls.setup{
}
nvim_lsp.pylsp.setup{
}
nvim_lsp.rust_analyzer.setup{
}
EOF

" KEY BINDINGS
let mapleader=" "

" Configure telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Configure nvim-cmp
lua << EOF
local cmp = require 'cmp'
cmp.setup {
	mapping = {},
	formatting = {},
	sources = {
		{ name = "nvim_lsp" }
	}
}
EOF

" FILE CONFIGURATIONS

" YAML Configuration
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

