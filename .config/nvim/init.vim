" ================== Plugins ==================
call plug#begin('~/.config/nvim/plugged')

" Tema
Plug 'jacoborus/tender.vim'

" UI
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'goolord/alpha-nvim'

" LSP / Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utils
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" ================== Config Básica ==================
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden
set incsearch
set ignorecase
set smartcase
set scrolloff=8
set termguicolors
set signcolumn=yes
set updatetime=300
set mouse=a

" ================== Tema ==================
colorscheme tender
set termguicolors
colorscheme default
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE
highlight SignColumn guibg=NONE
highlight EndOfBuffer guibg=NONE

" ================== Nvim Tree ==================
lua << EOF
require("nvim-tree").setup()
EOF

nnoremap <C-n> :NvimTreeToggle<CR>

" ================== Navegação entre janelas ==================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ================== Telescope ==================
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>

" ================== Buffers ==================
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>d :bd<CR>

" ================== Splits ==================
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>

" ================== CoC ==================
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-pyright'
\]

" Autocomplete TAB
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter confirma
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Navegação código
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gi <Plug>(coc-implementation)

" Docs
nnoremap K :call CocActionAsync('doHover')<CR>

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Format
nmap <leader>f  <Plug>(coc-format)

" Code actions
nmap <leader>a  <Plug>(coc-codeaction)

" Diagnóstico
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" ================== Airline ==================
let g:airline_theme = 'tender'
let g:airline#extensions#tabline#enabled = 1


" ================== alpha-nvim ==================
lua << EOF
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.buttons.val = {
dashboard.button("e", "  Novo arquivo", ":ene <BAR> startinsert <CR>"),
dashboard.button("f", "  Procurar arquivo", ":Telescope find_files<CR>"),
dashboard.button("r", "  Recentes", ":Telescope oldfiles<CR>"),
dashboard.button("q", "  Sair", ":qa<CR>"),
}

require("alpha").setup(dashboard.opts)
EOF
