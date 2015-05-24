set nocompatible					        " Use Vim defaults (much better than vi)
set encoding=utf-8
set showcmd 						          " Show incomplete cmds down the bottom
set hidden							          " Hide unclosed buffer instead of closing
set linebreak
set display+=lastline
set novisualbell
set noerrorbells
set modelines=0 					        " Security problems
set nomodeline
set nobk							            " Do not keep a backup file
set viminfo='20,\"50				      " 50 lines max of registers in .viminfo
set background=dark					      " Set correct colors for term
set nohlsearch						        " Do not highlight search terms
set autowrite						          " Save before :make, :suspend, etc
set backspace=indent,eol,start  	" Backspace everything in insert mode
set tildeop
set autoindent						        " Always set autoindenting on
set cinoptions=>2
set shiftwidth=2
set expandtab
set tabstop=2						          " 1 tab = 4 spaces
set mousehide						          " Hide the mouse pointer while typing
set gdefault						          " Don't need /g after :s or :g
set grepprg=ack-grep\ -a 			    " Use ack-grep instead of grep
set incsearch                   	" Incremental searching
set ignorecase                  	" Searches are case insensitive...
set smartcase                   	" ...unless there is at least one cap letter
set nofsync

let mapleader="," 					      " Change the mapleader from \ to ,
let c_comment_strings=1 			    " map <S-Insert> <MiddleMouse>

" ',,' to 'change buffer'
nnoremap <leader><leader> <c-^>

filetype plugin on 					      " Turn omnicompletion on
set ofu=syntaxcomplete#Complete

" Map ':w!!' to write file with sudo
cmap w!! %!sudo tee > /dev/null %

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

colorscheme evening

" Tab mapping
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr> 

nmap <F3> <ESC>:call LoadSession()<CR>
let s:sessionloaded = 0
function LoadSession()
  source Session.vim
  let s:sessionloaded = 1
endfunction
function SaveSession()
  if s:sessionloaded == 1
	mksession!
  end
endfunction
autocmd VimLeave * call SaveSession()

set fdm=marker
 
" Perl programming, have things in braces indenting themselves
autocmd FileType perl set smartindent
    au FileType perl source ~/.vim/bundle/Perldoc.vim/ftplugin/perl_doc.vim
set si "smart indent
au FileType perl set commentstring="%s"
au FileType perl set foldmarker=#\ {{{,#\ }}}

" CSS, also have things in braces indented
autocmd FileType css set smartindent

au! BufRead,BufNewFile *.txtl setfiletype textile

" <tab> autoindent
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" Yankring
let g:yankring_history_dir = '$HOME/.vim'

" template loading by extension
function! LoadTemplate()
  silent! 0r ~/.vim/skel/tmpl.%:e
  " Highlight %VAR% placeholders with the Todo colour group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()
"Jump between %VAR% placeholders in Normal mode with
" <Ctrl-p>
nnoremap <c-p> /%\u.\{-1,}%<cr>c/%/e<cr>
"Jump between %VAR% placeholders in Insert mode with
" <Ctrl-p>
inoremap <c-p> <ESC>/%\u.\{-1,}%<cr>c/%/e<cr>
set cpoptions-=a

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

nmap <Leader>o :set paste!
" Ctrl E to switch to last acceded buffer
nnoremap <C-e> <c-^> 

" CtrlP
:nmap ; :CtrlPBuffer<CR>

:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|flac)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

set t_Co=256
highlight Normal ctermbg=None

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'wikitopian/hardmode'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-scripts/Textile-for-VIM'
Bundle 'othree/html5-syntax.vim'
Bundle 'othree/html5.vim'
Bundle 'vim-scripts/Vimerl'
Bundle 'tpope/vim-haml'
Bundle 'vim-scripts/extradite.vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'hallettj/jslint.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'AndrewRadev/switch.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/dbext.vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/SuperTab-continued.'
Bundle 'vim-scripts/SQLComplete.vim'
Bundle 'vim-scripts/simplefold'
Bundle 'vim-scripts/showhide.vim'
Bundle 'kikijump/tslime.vim'
Bundle 'Perldoc.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'bitc/hdevtools'
Bundle 'bitc/vim-hdevtools'
Bundle 'tpope/vim-markdown'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'airblade/vim-gitgutter'
Bundle 'nbouscal/vim-stylish-haskell'
