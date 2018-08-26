set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" https://github.com/ctrlpvim/ctrlp.vim
" fuzzy finder 
Plugin 'ctrlpvim/ctrlp.vim'

" https://github.com/jiangmiao/auto-pairs
" automatic quote and bracket matching entry
Plugin 'jiangmiao/auto-pairs'

" https://github.com/tpope/vim-fugitive
" git wrapper
Plugin 'tpope/vim-fugitive'

" https://github.com/scrooloose/nerdtree
" project tree with git integration
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/vim-syntastic/syntastic
" syntax checking
" Plugin 'vim-syntastic/syntastic'

" https://github.com/fatih/vim-go
" golang integration
Plugin 'fatih/vim-go'

" https://github.com/mdempsky/gocode
" golang autocomplete
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

" https://github.com/tpope/vim-cucumber
" cucumber integration
Plugin 'tpope/vim-cucumber'

" https://github.com/morhetz/gruvbox
" gruvbox theme
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
syntax enable

set ls=2         " always show status line
set ruler        " show the cursor position all the time
set number
set relativenumber
set updatetime=100 " update statusline every 100ms (default 800ms)

" make backspace work like most programs
set backspace=indent,eol,start

" highlight trailing whitespace and tabs
" set listchars=tab:>\ ,trail:\ 
" set list

" Color Column {{{
" show colored 100th column
if exists('+colorcolumn')
    set colorcolumn=100
endif
" }}}

" File Browsing {{{
set path=.,,
set wildmode=longest,list,full
set wildmenu
" }}}

colorscheme gruvbox
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Syntastic settings {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" }}}

" Key Mappings {{{
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" turn off arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" nerdtree toggle on and off
" map <C-\> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFocus<CR>
" map <nop> <C-v><}><I></></><Esc>
" }}}

" nerdtree settings {{{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" }}}

" go settings {{{
" autocmd FileType go autocmd BufWritePre <buffer> GoFmt
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
" let g:syntastic_go_checkers = ['gofmt', 'golint', 'govet']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}}

" cucumber settings {{{
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2
" }}}
