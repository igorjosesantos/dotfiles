""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
" not a vi
" set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" start vundler
" filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" core plugins
Plugin 'gmarik/vundle'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'

" vim main plugins
" Plugin 'sjl/gundo.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/syntastic.git' " Syntax checking configuration
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'henrik/vim-indexed-search'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rhysd/clever-f.vim' " find text in file

" togglable panels
Plugin 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'

" language vundles
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'fatih/vim-go'
Plugin 'klen/python-mode'
Plugin 'plasticboy/vim-markdown'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-scripts/c.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'hylang/vim-hy'
Plugin 'ap/vim-css-color'
Plugin 'lepture/vim-css'
Plugin 'hail2u/vim-css3-syntax'

" databases
Plugin 'vim-scripts/SQLUtilities'
Plugin 'NagatoPain/AutoSQLUpperCase.vim'

" autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" snippets
" Plugin 'SirVer/ultisnips' " generate code snippets on Vim
Plugin 'honza/vim-snippets'

" enable all the plugins
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set number
set ls=2
" set cursorline
set nowrap
set backspace=indent,eol,start
set shell=zsh
set completeopt -=preview
set textwidth=100
set wildmenu
set noshowmode
set cmdheight=1
" set autoread
" Show ruler on column 150
set colorcolumn=150
set textwidth=150

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" set <leader>
let mapleader=","

" enable mouse
set mouse=a

" show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

" syntax highlighting
syntax on
colorscheme molokai

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" togglables without FN keys
" nnoremap <leader>1 :GundoToggle<CR>
set pastetoggle=<leader>2
nnoremap <leader>3 :TlistToggle<CR>
nnoremap <leader>4 :TagbarToggle<CR>
" nnoremap <leader>5 :NERDTreeToggle<CR>
map <silent> <C-k>b :NERDTreeToggle<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)

" open vimrc
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
nnoremap <leader>V :tabnew  ~/.config/nvim/init.vim<CR>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" syntastic
" let g:syntastic_python_checkers = []

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1

let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" YouCompleteMe
" let g:ycm_path_to_python_interpreter = '/home/user/anaconda3/bin/python'
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1

" ack configuration for find
if executable("ag")
  let g:ackprg = "ag --nogroup --column"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" reload ctags
nnoremap <leader>C :!ctags -R --fields=+l --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

" git and ack stuff
" let g:gitgutter_enabled = 1
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" nnoremap <leader>G mG:Git!
" nnoremap <leader>g :Git
nnoremap <leader>A :!ag
nnoremap <leader>a :Ag!

""""""""""""""""""""""""""""""""
"
" PROGRAMMING LANGUAGES
"
""""""""""""""""""""""""""""""""
" " vim-go settings
" let g:go_fmt_command = "goimports"
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
"
" " vim-go bindings
" augroup FileType go
"   au!
"   au FileType go nmap gd <Plug>(go-def)
"   au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
"
"   au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
"   au FileType go nmap <Leader>db <Plug>(go-doc-browser)
"
"   au FileType go nmap <Leader>i <Plug>(go-info)
"
"   au FileType go nmap <leader>r <Plug>(go-run)
"   au FileType go nmap <leader>b <Plug>(go-build)
"   au FileType go nmap <leader>t <Plug>(go-test)
" augroup END

" " Python Settings
" let g:pymode_rope = 1
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_lookup_project = 1
" let g:pymode_rope_goto_def_newwin = "e"
" let g:pymode_rope_completion = 1
" let g:pymode_rope_complete_on_dot = 1
"
"
" " Pymode Options
" let g:pymode_python = 'python3'
" let g:pymode_options_max_line_length = 100
" let g:pymode_options_colorcolumn = 0
" let g:pymode_folding = 0        " Turn off code folding
" let g:pymode_virtualenv = 1     " Auto fix vim python paths if virtualenv enabled
" let g:pymode_motion = 1         " Enable python objects and motion
" let g:pymode_trim_whitespaces = 1 "Trim unused white spaces on save
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 5
"
" " debugging
" let g:pymode_breakpoint = 1
"
" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" let g:pymode_indent = 1
"
" " linting
" let g:pymode_lint = 1
" let g:pymode_lint_cwindow = 0
" let g:pymode_lint_message = 1
" let g:pymode_lint_on_write = 1
" let g:pymode_lint_unmodified = 0
" let g:pymode_lint_on_fly = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8'] " 'mccabe']
" let g:pymode_lint_signs = 1
"
" "let g:pymode_lint_ignore = "E501,W"
" let g:pymode_lint_sort = ['E','C']

" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>r :!python %<cr>
  elseif(&ft=="hy")
    nnoremap <leader>r :!hy %<cr>
  elseif(&ft=="clojure")
    nnoremap <leader>r :!lein run<cr>
  elseif(&ft=="ruby")
    nnoremap <leader>r :!ruby %<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>r :!node %<cr>
  elseif(&ft=="php")
    nnoremap <leader>r :!php %<cr>
  elseif(&ft=="c")
    nnoremap <leader>r :!make run<cr>
  endif
endfunction

au BufEnter * call LangRunner()

" enable angular syntax
let g:used_javascript_libs = 'underscore,react,flux,redux,jquery,vue,angular'

""""""""""""""""""""""""""""""""
"
" COOL HACKS
"
""""""""""""""""""""""""""""""""
" save all buffers and exit
nnoremap <Leader>q :xa<CR>

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>h[1-4]
" function! HiInterestingWord(n)
"     " Save our location.
"     normal! mz
"     " Yank the current word into the z register.
"     normal! "zyiw
"     " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
"     let mid = 86750 + a:n
"     " Clear existing matches, but don't worry if they don't exist.
"     silent! call matchdelete(mid)
"     " Construct a literal pattern that has to match at boundaries.
"     let pat = '\V\<' . escape(@z, '\') . '\>'
"     " Actually match the words.
"     call matchadd("InterestingWord" . a:n, pat, 1, mid)
"     " Move back to our original location.
"     normal! `z
" endfunction
"
" nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
" nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
" nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
" nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
" nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
" nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
" nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>
"
" hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
" hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
" hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
" hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
" hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
" hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

highlight search ctermfg=white ctermbg=3423513

" better retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

""""""""""""""""""""""""""""""""
"
" BUG WORKAROUNDS
"
""""""""""""""""""""""""""""""""
" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has("gui_running")
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" make C-a, C-x work properly
set nrformats=

" make C-j work consistent in C programms
let g:C_Ctrl_j='off'

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" alternative approach for lines that are too long
" set colorcolumn=
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/


" Vim CSS3 configuration
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sublime/Atom commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment/uncomment code -> Ctrl+/

if has('win32')
  nmap <C-/> <leader>c<Space>
  vmap <C-/> <leader>c<Space>
else
  nmap <C-_> <leader>c<Space>
  vmap <C-_> <leader>c<Space>
endif

" Open/Close project dir files -> `Ctrl+k` and `b`
map <silent> <C-k>b :NERDTreeToggle<CR>

" Syntax checking configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
