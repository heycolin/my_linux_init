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
        " Plug
        call plug#begin('~/.vim/bundle')

        " vundle
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    elseif OSX()
        " Plug
        call plug#begin('~/.vim/bundle')

        " vundle
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    else
        " Plug
        call plug#begin('$VIM/vimfiles/bundle')

        " vundle
        set rtp+=$VIM/vimfiles/bundle/vundle/
        call vundle#rc('$VIM/vimfiles/bundle/')
    endif

    " for fzf setting
    " If installed using git
    set rtp+=~/.fzf
    " If installed using Homebrew
    set rtp+=/usr/local/opt/fzf


    set tags=./tags,tags
" }

" Bundle {
" Bundle -> Plug
    " 插件管理器
    Plug 'gmarik/vundle'
    " 历史文件列表
    Plug 'bufexplorer.zip'
    " cpp,h文件跳转
    Plug 'a.vim'
    Plug 'mark.vim'

    "------------------
    " code completions
    "------------------
    if WINDOWS()
        Plug 'shougo/neocomplete'
    else
        Plug 'Valloric/YouCompleteMe'
    endif
    " html 的插件
    " Plug 'mattn/emmet-vim'
    " 补全括号
    Plug 'raimondi/delimitmate'
    " 超级tab
    Plug 'ervandew/supertab'
    " snippets
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'
    "------ snipmate dependencies -------
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'

    "-----------------
    " fast navigation
    "-----------------
    " 自定义标记跳转
    Plug 'edsono/vim-matchit'
    " 快速跳转 <leader>-f
    Plug 'lokaltog/vim-easymotion'

    " 快速跳转 key-s
    Plug 'justinmk/vim-sneak'
    " 高亮
    Plug 'haya14busa/incsearch.vim'
    " 模糊高亮
    Plug 'haya14busa/incsearch-fuzzy.vim'

    " 快速搜索
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " git/svn 变更
    Plug 'mhinz/vim-signify'

    " 快速选择块
    Plug 'terryma/vim-expand-region'

    "--------------
    " fast editing
    "--------------
    " 修改包裹符号 cs ds
    " Plug 'tpope/vim-surround'
    " 注释
    Plug 'scrooloose/nerdcommenter'
    " 历史编辑别表
    Plug 'sjl/gundo.vim'
    " 代码对齐
    Plug 'godlygeek/tabular'
    " 缩进显示
    Plug 'nathanaelkane/vim-indent-guides'
    " 多搜索高亮
    Plug 'lfv89/vim-interestingwords'

    "--------------
    " ide features
    "--------------
    " 导航树
    Plug 'scrooloose/nerdtree'
    " tab 式窗口管理器
    " Plug 'humiaozuzu/tabbar'
    Plug 'majutsushi/tagbar'
    " Plug 'mileszs/ack.vim'
    " Plug 'petdance/ack'
    " 快速搜索，依赖the_sliver_searcher on mac/unix
    Plug 'rking/ag.vim'
    if has("gui_running")
        Plug 'kien/ctrlp.vim'
    endif
    " git冲突处理
    " Plug 'tpope/vim-fugitive'
    " Plug 'lokaltog/vim-powerline'
    " Plug 'powerline/powerline'
    Plug 'bling/vim-airline'
    Plug 'scrooloose/syntastic'
    Plug 'bronson/vim-trailing-whitespace'

    "-------------
    " other utils
    "-------------
    " Plug 'humiaozuzu/fcitx-status'
    Plug 'nvie/vim-togglemouse'

    "----------------------------------------
    " syntax/indent for language enhancement
    "----------------------------------------
    "------- web backend ---------
    " Plug '2072/php-indenting-for-vim'
    "Plug 'tpope/vim-rails'
    Plug 'lepture/vim-jinja'
    "Plug 'digitaltoad/vim-jade'

    "------- web frontend ----------
    " Plug 'othree/html5.vim'
    " Plug 'tpope/vim-haml'
    " Plug 'pangloss/vim-javascript'
    " Plug 'kchmck/vim-coffee-script'
    " Plug 'nono/jquery.vim'
    " Plug 'groenewege/vim-less'
    " Plug 'wavded/vim-stylus'
    " Plug 'nono/vim-handlebars'

    "------- markup language -------
    " Plug 'tpope/vim-markdown'
    " markdown 实时预览
    Plug 'iamcco/markdown-preview.vim'
    " Plug 'timcharper/textile.vim'

    "------- ruby --------
    " Plug 'tpope/vim-endwise'

    "------- go ----------
    " Plug 'fatih/vim-go'

    "------- fps ------
    Plug 'kien/rainbow_parentheses.vim'
    " Plug 'wlangstroth/vim-racket'
    " Plug 'vim-scripts/vimclojure'
    " Plug 'rosstimson/scala-vim-support'

    "--------------
    " color schemes
    "--------------
    Plug 'rickharris/vim-blackboard'
    Plug 'altercation/vim-colors-solarized'
    Plug 'rickharris/vim-monokai'
    Plug 'tpope/vim-vividchalk'
    Plug 'lokaltog/vim-distinguished'
    Plug 'chriskempson/vim-tomorrow-theme'
    Plug 'fisadev/fisa-vim-colorscheme'

    "--------------
    " multiple-cursors
    "--------------
    " 多光标编辑
    Plug 'terryma/vim-multiple-cursors'

    "--------------
    "--------------
    " python 模块
    Plug 'python.vim'
    " python 语法检查模块
    Plug 'davidhalter/jedi-vim'


call plug#end()
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
    nmap <D-/> :
    nnoremap ,e :e <C-R>=expand('%:p:h') . '/'<CR>
    nnoremap ,b :BufExplorer<CR>
    nnoremap <leader>t :Tabularize /
    " nnoremap <leader>, :Tabularize /,/l0r1<CR>
    nnoremap <leader>, :Tabularize /^[^,}]*\zs,/l0r1<CR>
    nnoremap <leader>) :Tabularize /)/l1r0<CR>
    nnoremap <leader>( :Tabularize /(/l0r1<CR>
    nnoremap <leader>0 :Tabularize /)/l1r0<CR>
    nnoremap <leader>9 :Tabularize /(/l0r1<CR>

    " nnoremap zoo gg V G zO<CR>
    " nnoremap zcc gg V G zc<CR>

    " " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
    " fun! ToggleFullscreen()
        " call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    " endf
    " " 全屏开/关快捷键
    " map <silent> <F12> :call ToggleFullscreen()<CR>
    " " 启动 vim 时自动全屏
    " autocmd VimEnter * call ToggleFullscreen()

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
    " nmap <silent> <leader>ev :e $MYVIMRC<CR>
    " nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " eggcache vim
    " nnoremap ; :
    :command! W w
    :command! WQ wq
    :command! Wq wq
    :command! Q q
    :command! Qa qa
    :command! QA qa
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
    set autoread

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
    " noremap <leader>bg :call ToggleBG()<CR>

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
    " set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    " set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    set fileformats=unix,dos

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
        " color Tomorrow-Night-Eighties
        " color desert
        set background=dark
        color solarized

        " git clone git://github.com/seebi/dircolors-solarized.git
        " cp ~/dircolors-solarized/dircolors.256dark ~/.dircolors
        " eval 'dircolors .dircolors'
        " export TERM=xterm-256color to .zshrc
        " source ~/.zshrc
        " git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
        " ./gnome-terminal-colors-solarized/set_dark.sh
    endif

    " if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        " let g:solarized_termcolors=256
        " let g:solarized_termtrans=1
        " let g:solarized_contrast="normal"
        " let g:solarized_visibility="normal"
        " color solarized             " Load a colorscheme
    " endif

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
    " set number                      " Line numbers on
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
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
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

    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
    " }

" syntastic {
    " let g:syntastic_python_python_exe = 'python3'
    let g:syntastic_python_checkers = ['flake8']

    " function! Parse_Python_Shebang()
        " let line = getline(1)
        " if line =~# '\m^#!\s*[^ \t]*\<python2\=\>'
            " let g:syntastic_python_python_exec = g:syntastic_python2_python_exe
            " let g:syntastic_python_checkers = g:syntastic_python2_checkers
        " elseif line =~# '\m^#!\s*[^ \t]*\<python3\>'
            " let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
            " let g:syntastic_python_checkers = g:syntastic_python3_checkers
        " else
            " let g:syntastic_python_python_exec = g:syntastic_python_default_version
            " let g:syntastic_python_checkers = g:syntastic_python_default_version =~# '\<python3$' ?
                " \ g:syntastic_python3_checkers : g:syntastic_python2_checkers
        " endif
    " endfunction

    " command! SyntasticPython2 let g:syntastic_python_python_exec = g:syntastic_python2_python_exe |
        " \ let g:syntastic_python_checkers = g:syntastic_python2_checkers
    " command! SyntasticPython3 let g:syntastic_python_python_exec = g:syntastic_python3_python_exe |
        " \ let g:syntastic_python_checkers = g:syntastic_python3_checkers

    " autocmd BufWinEnter *.py call Parse_Python_Shebang()
" }
"
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

" Markdown {
    if OSX()
        " osx
        let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
    else
        " ubuntu/windows
        " chromium-browser
        " let g:mkdp_path_to_chrome = "google-chrome"
        let g:mkdp_path_to_chrome = "chromium-browser"
    endif
    " path to the chrome or the command to open chrome(or other modern browsers)

    let g:mkdp_auto_start = 0
    " set to 1, the vim will open the preview window once enter the markdown
    " buffer

    let g:mkdp_auto_open = 0
    " set to 1, the vim will auto open preview window when you edit the
    " markdown file

    let g:mkdp_auto_close = 1
    " set to 1, the vim will auto close current preview window when change
    " from markdown buffer to another buffer

    let g:mkdp_refresh_slow = 0
    " set to 1, the vim will just refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
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

if WINDOWS()
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

        " let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_key_invoke_completion = ''

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
        let g:neocomplete#enable_auto_select = 0

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
else
    " YouCompleteMe {
        let g:ycm_confirm_extra_conf = 0
        let g:syntastic_always_populate_loc_list = 1
        let g:ycm_error_symbol = '>>'
        let g:ycm_warning_symbol = '>*'
        " nnoremap gl :YcmCompleter GoToDeclaration<CR>
        " nnoremap gf :YcmCompleter GoToDefinition<CR>
        " nnoremap gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
        let g:acp_enableAtStartup = 1

        " " enable completion from tags
        " let g:ycm_collect_identifiers_from_tags_files = 1

        " " remap Ultisnips for compatibility for YCM
        " let g:UltiSnipsExpandTrigger = '<C-j>'
        " let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        " let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

        " " Haskell post write lint and check with ghcmod
        " " $ `cabal install ghcmod` if missing and ensure
        " " ~/.cabal/bin is in your $PATH.
        " if !executable("ghcmod")
        " autocmd BufWritePost *.hs GhcModCheckAndLintAsync
        " endif

        " " For snippet_complete marker.
        " if !exists("g:spf13_no_conceal")
        " if has('conceal')
        " set conceallevel=2 concealcursor=i
        " endif
        " endif

        " " Disable the neosnippet preview candidate window
        " " When enabled, there can be too much visual noise
        " " especially when splits are used.
        " set completeopt-=preview
    " }
endif


" SuperTab {
    " let g:SuperTabDefultCompletionType='context'
    let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
    let g:SuperTabRetainCompletionType=2
    let g:SuperTabMappingForward="<tab>"

    function! DoNothing(findstart, base)
    endfunction
    set completefunc=DoNothing
" }

" agn.vim {
    " You can specify a custom ag name and path in your .vimrc like so:
    " let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"
    let g:ag_prg="ag --vimgrep"
    " You can configure ag.vim to always start searching from your project root instead of the cwd
    let g:ag_working_path_mode="r"
" }

" incsearch {

    " You can use other keymappings like <C-l> instead of <CR> if you want to
    " use these mappings as default search and somtimes want to move cursor with
    " EasyMotion.
    " function! s:incsearch_config(...) abort
      " return incsearch#util#deepextend(deepcopy({
      " \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
      " \   'keymap': {
      " \     "\<CR>": '<Over>(easymotion)'
      " \   },
      " \   'is_expr': 0
      " \ }), get(a:, 1, {}))
    " endfunction
    " noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    " noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    " noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
" }

" incsearch-fuzzy {
    map z/ <Plug>(incsearch-fuzzy-/)
    map z? <Plug>(incsearch-fuzzy-?)
    map zg/ <Plug>(incsearch-fuzzy-stay)
" }

if has("gui_running")
    " ctrlp {
        set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
        let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
    " }
else
    " FZF {
        nmap <c-p> :FZF<CR>
    " }
endif

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

" 更新最近修改时间和文件名 {
    "进行版权声明的设置
    function! Relpath(filename)
        if WINDOWS()
            let cwd = substitute(getcwd(), "\\" , "/", "gc")
            let filename = substitute(a:filename, "\\" , "/", "gc")
            let s = substitute(a:filename, l:cwd, "\.", "")
            return s
        endif

        let cwd = getcwd()
        let s = substitute(a:filename, l:cwd , "\.", "")
        return s
    endfunction

    "添加或更新头
    map <F4> :call TitleDet()<cr>

    function! AddPrevfix()
        let extension = expand("%:e")
        if extension == 'lua'
            return '-- '
        elseif extension == 'py'
            return '# '
        else
            return '// '
    endfunction

    function! AddStartLine()
        let extension = expand("%:e")
        if extension == 'lua'
            return '--- '
        elseif extension == 'py'
            return '# '
        else
            return '// '
    endfunction

    function! AddCopyRight(lineno)
        let n = a:lineno
        call append(n,AddPrevfix()."Copyright (c) 2015-2016 KOOGAME. All rights reserved.")
        return n + 1
    endfunction

    function! AddTitleHead(lineno)
        let n = a:lineno
        let extension = expand("%:e")
        if extension == 'py'
            call append(n,AddPrevfix()."! /usr/bin/python")
            let n = n + 1
            call append(n,AddPrevfix()."-*- coding:utf-8 -*-")
            let n = n + 1
            call append(n,"'''")
        elseif extension == 'lua'
            call append(n,AddPrevfix()."=====================================================")
        else
            return n
        endif

        return n + 1
    endfunction

    function! AddTitleTail(lineno)
        let n = a:lineno
        let extension = expand("%:e")
        if extension == 'py'
            call append(n,"'''")
        elseif extension == 'lua'
            call append(n,AddPrevfix()."=====================================================")
        else
            return n
        endif

        return n + 1
    endfunction

    function! AddAuthor(lineno)
        let n = a:lineno
        call append(n,AddPrevfix()."@Author        : colin")
        return n + 1
    endfunction

    function! AddFileName(lineno)
        let n = a:lineno
        call append(n,AddPrevfix()."@FileName      : ".Relpath(expand("%:t")))
        return n + 1
    endfunction

    function! AddDescription(lineno)
        let n = a:lineno
        call append(n,AddPrevfix()."@Description   : ")
        return n + 1
    endfunction

    function! AddModified(lineno)
        let n = a:lineno
        call append(n,AddPrevfix()."@Last modified : ".strftime("%Y-%m-%d %H:%M"))
        return n + 1
    endfunction

    function! AddTitle()
        let n = 0
        let n = AddTitleHead(n)
        let n = AddCopyRight(n)
        let n = AddAuthor(n)
        let n = AddFileName(n)
        let n = AddDescription(n)
        let n = AddModified(n)
        let n = AddTitleTail(n)
    endfunction

    function! UpdateTitle()
        normal m'
        execute '/Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
        normal ''
        normal mk
        " execute '/FileName\s*:/s@:.*$@\=": ".Relpath(expand("%:p"))@'
        execute '/FileName\s*:/s@:.*$@\=": ".Relpath(expand("%:t"))@'
        execute "noh"
        normal 'k
    endfunction
    "判断前10行代码里面，是否有Last modified这个单词，
    "如果没有的话，代表没有添加过作者信息，需要新添加；
    "如果有的话，那么只需要更新即可
    function! TitleDet()
        let n=1
        "默认为添加
        while n < 10
            let line = getline(n)
            if line =~ '^\{,5}.Last\smodified\s*:\S*.*$'
                call UpdateTitle()
                return
            endif
            let n = n + 1
        endwhile
        call AddTitle()
    endfunction
    " au BufWrite *.lua call TitleDet()
    " au BufWrite *.py call TitleDet()
" }

" 给lua文件当前行的function添加注释信息 {
    map <F2> :call FunctionDet()<cr>

    function! LuaParserFunction(linenum, linestr)
        let n = a:linenum
        let funcStart  = matchend(a:linestr,'function\s')
        let funcEnded  = match(a:linestr,'(')
        let paramStart = matchend(a:linestr, '(')
        let paramEnded = match(a:linestr,')')
        let funcname   = strpart(a:linestr,funcStart , funcEnded  - funcStart)
        let paramStr   = strpart(a:linestr,paramStart, paramEnded - paramStart)
        let paramStr   = substitute(l:paramStr, '\s', '', 'g')
        let paramList  = split(l:paramStr, ',')
        " 开始增加文本
        call append(n,AddStartLine().l:funcname)
        let n = n + 1
        call append(n,AddPrevfix()." ")
        let n = n + 1
        for param in paramList
            call append(n,AddPrevfix()."@param ".param.' ')
            let n = n + 1
        endfor
        call append(n,AddPrevfix()."@return ")
        let n = n + 1
        call append(n,AddPrevfix()."@usage ")
        let n = n + 1
    endfunction

    function! LuaFunctionDet()
        let n = line('.')
        let line = getline(n)
        if line =~ '.*function\s.*(.*)'
            call LuaParserFunction(n-1,l:line)
        endif
    endfunction

    function! FunctionDet()
        let extension = expand("%:e")
        if extension == 'lua'
            call LuaFunctionDet()
        endif
    endfunction
" }
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" <c-r><c-w> 或者 <c-r>=expand("<cword>")
" 例子：
" 1. nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>

" 2. nmap <silent> <leader>h <ESC>:lv /\<<c-r><c-w>\>/j **/*.[h]<CR>:lw<CR>

" vnoremap <silent> gv :vim /<C-R>=expand("<cword>")/ ** <CR>:copen<CR>
" nmap <silent> gv :vim /<C-R>=expand("<cword>")/ ** <CR>:copen<CR>
nmap <silent> gv <ESC>:vim /\<<c-r><c-w>\>/ **/*.lua<CR>:copen<CR>

" vnoremap * :
    " \let old_reg=getreg('"')let old_regtype=getregtype('"')
    " \gvy/=substitute(
    " \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')
    " \gV:call setreg('"', old_reg, old_regtype)

" vnoremap # :
    " \let old_reg=getreg('"')let old_regtype=getregtype('"')
    " \gvy?=substitute(
    " \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')
    " \gV:call setreg('"', old_reg, old_regtype)
