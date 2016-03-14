" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          " set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

    if LINUX()
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    elseif OSX()
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    else
        set rtp+=$VIM/vimfiles/bundle/vundle/
        call vundle#rc('$VIM/vimfiles/bundle/')
    endif


    set tags=/home/colin/sprite/tags,/Users/colin/dev/pokemon/tags,./tags
" }

" Bundle {
    Bundle 'gmarik/vundle'
    Bundle 'bufexplorer.zip'
    Bundle 'a.vim'

    "------------------
    " code completions
    "------------------
    Bundle 'shougo/neocomplete'
    Bundle 'mattn/emmet-vim'
    Bundle 'raimondi/delimitmate'
    Bundle 'ervandew/supertab'
    " snippets
    Bundle 'garbas/vim-snipmate'
    Bundle 'honza/vim-snippets'
    "------ snipmate dependencies -------
    Bundle 'marcweber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'

    "-----------------
    " fast navigation
    "-----------------
    " Bundle 'edsono/vim-matchit'
    " Bundle 'lokaltog/vim-easymotion'

    "--------------
    " fast editing
    "--------------
    " Bundle 'tpope/vim-surround'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'sjl/gundo.vim'
    Bundle 'godlygeek/tabular'
    Bundle 'nathanaelkane/vim-indent-guides'

    "--------------
    " ide features
    "--------------
    Bundle 'scrooloose/nerdtree'
    Bundle 'humiaozuzu/tabbar'
    Bundle 'majutsushi/tagbar'
    Bundle 'mileszs/ack.vim'
    Bundle 'kien/ctrlp.vim'
    Bundle 'tpope/vim-fugitive'
    " Bundle 'lokaltog/vim-powerline'
    " Bundle 'powerline/powerline'
    Bundle 'bling/vim-airline'
    Bundle 'scrooloose/syntastic'
    Bundle 'bronson/vim-trailing-whitespace'

    "-------------
    " other utils
    "-------------
    " Bundle 'humiaozuzu/fcitx-status'
    Bundle 'nvie/vim-togglemouse'

    "----------------------------------------
    " syntax/indent for language enhancement
    "----------------------------------------
    "------- web backend ---------
    " Bundle '2072/php-indenting-for-vim'
    "Bundle 'tpope/vim-rails'
    Bundle 'lepture/vim-jinja'
    "Bundle 'digitaltoad/vim-jade'

    "------- web frontend ----------
    " Bundle 'othree/html5.vim'
    " Bundle 'tpope/vim-haml'
    " Bundle 'pangloss/vim-javascript'
    " Bundle 'kchmck/vim-coffee-script'
    " Bundle 'nono/jquery.vim'
    " Bundle 'groenewege/vim-less'
    " Bundle 'wavded/vim-stylus'
    " Bundle 'nono/vim-handlebars'

    "------- markup language -------
    " Bundle 'tpope/vim-markdown'
    " Bundle 'timcharper/textile.vim'

    "------- ruby --------
    " Bundle 'tpope/vim-endwise'

    "------- go ----------
    " Bundle 'fatih/vim-go'

    "------- fps ------
    Bundle 'kien/rainbow_parentheses.vim'
    " Bundle 'wlangstroth/vim-racket'
    " Bundle 'vim-scripts/vimclojure'
    " Bundle 'rosstimson/scala-vim-support'

    "--------------
    " color schemes
    "--------------
    Bundle 'rickharris/vim-blackboard'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'rickharris/vim-monokai'
    Bundle 'tpope/vim-vividchalk'
    Bundle 'lokaltog/vim-distinguished'
    Bundle 'chriskempson/vim-tomorrow-theme'
    Bundle 'fisadev/fisa-vim-colorscheme'

    "--------------
    " multiple-cursors
    "--------------
    Bundle 'terryma/vim-multiple-cursors'

    "==============================================
" }

" Key (re)Mappings {
    " let mapleader = '\'

    " set pastetoggle=<F2>
    " nnoremap <F2> :set invpaste paste?<CR>
    nmap <F3> :GundoToggle<cr>
    nmap <F4> :IndentGuidesToggle<cr>
    nmap <F6> :call ToggleBG()<cr>
    nmap <F7> :NeoCompleteDisable<cr>
    nmap <F8> :NeoCompleteEnable<cr>
    nmap <F9> :NERDTreeToggle<cr>
    nmap <F10> :TagbarToggle<cr>
    nmap <F11> :BufExplorer<cr>
    nmap <D-/> :
    nnoremap ,e :e <C-R>=expand('%:p:h') . '/'<CR>
    nnoremap <leader>t :Tabularize /
    nnoremap <leader>, :Tabularize /,/l0r1

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nmap j gj
    nmap k gk

    " ctrl+v paste test when in insert mode
    imap <c-v> <c-r>*

    " ctags
    nnoremap <c-]> g]

    " easier navigation between split windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " w!! to sudo & write a file
    cmap w!! %!sudo tee >/dev/null %
    " cmap w!! w !sudo tee % >/dev/null

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    "  FIXME: Revert this f70be548
    " fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
    " map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " eggcache vim
    nnoremap ; :
    :command W w
    :command WQ wq
    :command Wq wq
    :command Q q
    :command Qa qa
    :command QA qa
    " :command Tab Tabularize /

    " for macvim
    if has("gui_running")
        set go=aAce  " remove toolbar
        "set transparency=30
        " show tab 2--show,1--don't show
        set showtabline=1
        set columns=140
        set lines=40
        noremap <D-M-Left> :tabprevious<cr>
        noremap <D-M-Right> :tabnext<cr>
        map <D-1> 1gt
        map <D-2> 2gt
        map <D-3> 3gt
        map <D-4> 4gt
        map <D-5> 5gt
        map <D-6> 6gt
        map <D-7> 7gt
        map <D-8> 8gt
        map <D-9> 9gt
        map <D-0> :tablast<CR>
    endif
" }

" General {
    set background=dark         " Assume a dark background

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set mouse=a                         " Automatically enable mouse usage
    set mousehide                       " Hide the mouse cursor while typing
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    " set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Setting up the directories {
        " set backup                  " Backups are nice ...
        " if has('persistent_undo')
        "     set undofile                " So is persistent undo ...
        "     set undolevels=1000         " Maximum number of changes that can be undone
        "     set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        " endif

        "  " Add exclusions to mkview and loadview
        "  " eg: *.*, svn-commit.tmp
        "  let g:skipview_files = [
        "      \ '\[example pattern\]'
        "      \ ]
    " }
" }

" Vim UI {
    " color desert
    if has("gui_running")
        set background=dark
        color solarized
    else
        color desert
    endif

    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
    endif

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        if !exists('g:override_spf13_bundles')
            set statusline+=%{fugitive#statusline()} " Git Hotness
        endif
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    " highlight current line
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    " set cursorline                  " Highlight current line
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    set cursorline cursorcolumn

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set backspace=indent,eol,start  " More powerful backspacing
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set matchtime=2                 " show matching bracket for 0.2 seconds
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    " set wildmode=list:full
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    " set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=5                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    " set nofoldenable              " disable folding"
    set confirm                     " prompt when existing from an unsaved file
    set title                       " show file in titlebar
    set go=                         " don's show menu

    set report=0                                                      " always report number of lines changed                "
    set matchpairs+=<:>                                               " specially for html

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Formatting {
    " set nowrap                      " Do not wrap long lines
    set wrap                        " wrap lines
    set autoindent                  " Indent at the same level of the previous line
    set smartindent                 " indent when
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your

    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | endif "call StripTrailingWhitespace() | endif
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType haskell setlocal commentstring=--\ %s
    autocmd FileType haskell,rust setlocal nospell
    autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
    autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
    autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
    autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.py set foldmethod=indent foldnestmax=2
    autocmd BufNewFile,BufRead *.lua set foldmethod=indent foldnestmax=20
" }

" GUI Settings {
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if LINUX() && has("gui_running")
            set guifont=Consolas\ for\ Powerline\ 10,Monaco\ 10,Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif OSX() && has("gui_running")
            set guifont=Monaco:h14,Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            set guifont=Consolas\ for\ Powerline:h10,Monaco:h11,Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }

" tabbar {
    let g:Tb_MaxSize = 2
    let g:Tb_TabWrap = 1

    hi Tb_Normal guifg=white ctermfg=white
    hi Tb_Changed guifg=green ctermfg=green
    hi Tb_VisibleNormal ctermbg=252 ctermfg=235
    hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white
" }

" easy-motion {
    let g:EasyMotion_leader_key = '<Leader>'
" }

" Tagbar {
    let g:tagbar_left=0
    let g:tagbar_width=30
    let g:tagbar_autofocus = 1
    let g:tagbar_sort = 0
    let g:tagbar_compact = 1
    " tag for coffee
    if executable('coffeetags')
        let g:tagbar_type_coffee = "{
                    \ 'ctagsbin' : 'coffeetags',"{
                    \ 'ctagsargs' : '',
                    \ 'kinds' : [
                    \ 'f:functions',
                    \ 'o:object',
                    \ ],
                    \ 'sro' : ".",
                    \ 'kind2scope' : 
                    \ 'f' : 'object',
                    \ 'o' : 'object',
                    \ 
                    \ "}

        let g:tagbar_type_markdown = 
                    \ 'ctagstype' : 'markdown',"{
                    \ 'sort' : 0,
                    \ 'kinds' : [
                    \ 'h:sections'
                    \ ]
                    \ "}"}
    endif
" }

" Nerd Tree {
    let NERDChristmasTree=1
    let NERDTreeWinSize=30
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    " let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
    let NERDTreeShowBookmarks=0
    let NERDTreeWinPos="left"
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen=1

    " nerdcommenter
    let NERDSpaceDelims=1
    " nmap <D-/> :NERDComToggleComment<cr>
    let NERDCompactSexyComs=1
" }

" ZenCoding {
    let g:user_emmet_expandabbr_key='<C-j>'
" }

" powerline {
    let g:Powerline_symbols = 'fancy'
    set encoding=utf-8
    set fillchars+=stl:\ ,stlnc:\
" }

" airline {
    set t_Co=256
    set laststatus=2
    set lazyredraw
    " let g:airline_theme='powerlineish'
    " 使用powerline打过补丁的字体
    " let g:airline_powerline_fonts=1
    " if !exists('g:airline_symbols')
        " let g:airline_symbols={}
    " endif
    " 关闭空白符检测
    let g:airline#extensions#whitespace#enabled=0
" }

" neocomplete {
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " AutoComplPop.
    let g:acp_enableAtStartup = 1
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        " return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    inoremap <expr><C-\>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    " inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " AutoComplPop like behavior.
    let g:neocomplete#enable_auto_select = 1

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }

" SuperTab {
    " let g:SuperTabDefultCompletionType='context'
    let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
    let g:SuperTabRetainCompletionType=2
    let g:SuperTabMappingForward="<tab>"

    function! DoNothing(findstart, base)
    endfunction
    set completefunc=DoNothing
" }

" ctrlp {
    set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
    let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
" }

" multiple-cursors {
    "let g:multi_cursor_use_default_mapping=0
    "" Default mapping
    "let g:multi_cursor_next_key='<C-n>'
    "let g:multi_cursor_prev_key='<C-p>'
    "let g:multi_cursor_skip_key='<C-x>'
    "let g:multi_cursor_quit_key='<Esc>'
    " Map start key separately from next key
    "let g:multi_cursor_start_key='<F6>'
    "
    "let g:multi_cursor_start_key='<C-n>'
    "let g:multi_cursor_start_word_key='g<C-n>'
    "let g:multi_cursor_quit_key='<C-c>'
    nnoremap <C-c> :call multiple_cursors#quit()<CR>
    " Called once right before you start selecting multiple cursors
    function! Multiple_cursors_before()
        if exists(':NeoCompleteLock')==2"{
            exe 'NeoCompleteLock'
        endif"}
    endfunction

    " Called once only when the multiple selection is canceled (default<Esc>)
    function! Multiple_cursors_after()
        if exists(':NeoCompleteUnlock')==2"{
            exe 'NeoCompleteUnlock'
        endif"}
    endfunction
" }

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

" 设置文件的代码形式
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,gb2312,gb18030,gbk,latin1,latin-1

" vim的菜单乱码解决：
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" vim提示信息乱码的解决
language messages zh_CN.utf-8

