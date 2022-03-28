syntax on;
set noerrorbells
set nu
set nohlsearch
set nowrap
set smartcase
set incsearch
set guioptions-=T "Removes Toolbar
set ruler "Where am i
set showcmd "Show (partial) command in status line
set nolist
set relativenumber
set hidden
set mouse=a
set noswapfile
set nobackup
"filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set undodir="~/.config/Fnvim/undodir"
set undofile
set so=8
set signcolumn=yes
set cmdheight=2
set background=dark
set encoding=UTF-8
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
 Plug 'preservim/nerdtree'
" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'    " JavaScript support

Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'Soares/base16.nvim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

" CoC extensions
let g:coc_global_extensions = ["coc-rust-analyzer","coc-tsserver"]

"let g:lightline = { 'colorscheme': 'onehalfdark' }
"
colorscheme gruvbox
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



let mapleader=" "
let g:LanguageClient_serverCommands ={ 'rust': ['~/.cargo/bin/rustup','run','stable','rls'],}
let g:deoplete#enable_at_startup = 1
nmap <F5> <Plug>(lcn-menu)
autocmd FileType rust nmap <silent> gr <Plug>(lcn-rename)
" SETTINGS START
set completeopt=longest,menuone
" SETTINGS END


"COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" COC-VIM TAB SETTINGS END


"Cycling through the buffers

nnoremap <silent> <Left> :bp<CR>

nnoremap <c-s> :w<CR>
inoremap <c-s> <c-o>:w<CR>

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'



" Press SHIT + k to show documenation, i.e show infereed type on a variable
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
  call CocAction('doHover')
  endif
endfunction

 map <Leader>n <plug>NERDTreeTabsToggle<CR>


let NERDTreeMapOpenInTab='\r'
let NERDTreeMapOpenInTab='<ENTER>'

