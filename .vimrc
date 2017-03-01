set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" Let Vundle manage Vundle, required
" Steps to install Vundle
" 1. git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2. vim +PluginInstall +qall
Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-tree'
" Plugin 'vim-scripts/peaksea.vim'
Plugin 'peaksea'
" Plugin 'crucerucalin/peaksea.vim'
" Plugin 'Syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'vimwiki/vimwiki.git'
let wiki_1 = {}
let wiki_1.path = '~/Documents/Aman/Study/wiki/vimwiki'
let wiki_1.template_path = '~/Documents/Aman/Study/wiki/vimwiki/templates'
let wiki_1.template_default = 'default'
let wiki_1.template_ext = '.html'
let wiki_1.auto_toc = 1
let wiki_1.auto_export = 1
let wiki_1.path_html = '/home/swati/Documents/Aman/Study/wiki/html/vimwiki'
let wiki_2 = {}
let wiki_2.path = '~/Documents/Aman/Study/wiki/vimwiki_md'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.auto_toc = 1
let wiki_2.auto_export = 1
let wiki_2.custom_wiki2html = '/home/swati/Documents/Aman/Study/wiki/custom_wiki2html/wiki2html.sh'
let wiki_2.path_html = '/home/swati/Documents/Aman/Study/wiki/html/vimwiki_md'
let g:vimwiki_list = [wiki_2, wiki_1]
let g:vimwiki_ext2syntax = {
  \ '.md': 'markdown'}
" From https://gist.github.com/enpassant/0496e3db19e32e110edca03647c36541
autocmd FileType markdown call SetMarkdownOptions()

function! SetMarkdownOptions()
	call VimwikiSet('syntax', 'markdown')
    call VimwikiSet('custom_wiki2html', '/home/swati/Documents/Aman/Study/wiki/custom_wiki2html/wiki2html.sh')
endfunction


" ''
let g:vimwiki_use_mouse = 1
let g:vimwiki_hl_headers = 1

Plugin 'EinfachToll/DidYouMean'

" Tagbar support for Vimwiki
" See https://raw.githubusercontent.com/vimwiki/utils/master/vwtags.py
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.vim/bundle/vimwiki/utils/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }


" The default setting of 'laststatus' is for the statusline to not appear
" until a split is created. If you want it to appear all the time, set
" laststatus to 2
set laststatus=2
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 0
set ttimeoutlen=50


" For Indent-Guides
Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'Indent-Guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" For snipMate from Github
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" Optional:
Bundle "honza/vim-snippets"

" Plugin 'ide'
call vundle#end()

"
"
"
" Needs exuberant-ctags installed
Plugin 'Tagbar'
let g:tagbar_autoclose=0
let g:tagbar_left = 0
let g:tagbar_single_click = 1
" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)
" To open tagbar only for specified filetypes
" autocmd FileType c,cpp nested :TagbarOpen
let g:tagbar_width = 40
" Display panel with y (or ,y)
noremap <Leader>y :TagbarToggle<CR>
" By default, leader is "\"


set nu
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set hlsearch

" Old config for tagbar
" set runtimepath+=$HOME/.vim/majutsushi-tagbar-9d5af93


"colorscheme peachpuff
"colorscheme pablo
"colorscheme peaksea
colorscheme slate
set background=dark


filetype plugin indent on     " required


" Use Cntrl-Left and Ctrl-Right to jump and move tabs in vim and gvim
" For this to work in GNU screen
set term=xterm-256color
"nnoremap <C-S-Left> :tabprevious<CR>
"nnoremap <C-S-Right> :tabnext<CR>
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
nnoremap <Leader><Left> :tabprevious<CR>
nnoremap <Leader><Right> :tabnext<CR>

" correcting encoding for nerdtree
set encoding=utf8

" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"

" " Set Syntastic Location
" " statusline flag
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*"
" " Error signs
" highlight SyntasticErrorSign guifg=white guibg=red
" " Open and close locations window automatically
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'


""""" "  Highlight matches when jumping to next

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    " let ring = matchadd('WhiteOnRed', target_pat, 101)
    let ring = matchadd('IncSearch', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
    call matchdelete(ring)
    redraw
endfunction


""""" Syntax Highlighting
syntax enable


""""" Allow backspace key to erase previously entered characters in insert mode
" From http://vim.wikia.com/wiki/Erasing_previously_entered_characters_in_insert_mode
set backspace=2


""""" Search in a limited scope (within a visual selection)
" http://stackoverflow.com/questions/2921752/limiting-search-scope-for-code-in-vim
vnoremap <M-/> <Esc>/\%V


""""" Use Relative Numbering
set relativenumber
set number

" Allow control+arrow keys in insert mode
map <Esc>[1;5D <C-Left>
map! <Esc>[1;5D <C-Left>
map <Esc>[1;5C <C-Right>
map! <Esc>[1;5C <C-Right>
"
" Always open files in new tabs
" From  http://vim.wikia.com/wiki/Alternative_tab_navigation#Open_files_always_in_new_tabs
" autocmd VimEnter * tab all
" autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
" " Syntax highlighting does not work after first tab



""""
""""" Add fzf plugin
set rtp+=~/.fzf


""""" Open any file using FZF
nnoremap <silent> <Leader>t :FZF<CR>
nnoremap <silent> <C-t> :FZF -m<cr>


""""" Select buffer with FZF
" From https://github.com/junegunn/fzf/wiki/Examples-(vim)
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'sbuffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

""""" MRU search using FZF
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

""""" Set switchbuffer behaviour
set switchbuf=usetab,newtab

""""" More natural splits
set splitbelow
set splitright

""""" Shortcut to tabedit
nnoremap tt  :tabedit<Space>

""""" Mark bad whitespace
" From
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" highlight BadWhitespace guibg=red ctermbg=red
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.h,*.hpp match BadWhitespace /\s\+$/
"" Now handled by Plugin ntpeters/vim-better-whitespace

""""" Show current function-name in C programs
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>

""""" Easily switch C/C++ source and header files
" from http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F5> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" Clear the search buffer when you press ,/
nmap <silent> <Leader>/ :nohlsearch<CR>

" Open more than 10 tabs
set tabpagemax=25

"""" Syntax Highlighting
syntax enable
"
"""" Make colorschemes work properly when Vim is used inside tmux and GNU
"""" screen
set t_ut=

"""" Disable Vim's increment function
map <C-a> <Nop>

"""" Set color for selecting text
hi Visual		guifg=#000000	guibg=#a6caf0	gui=NONE


"""" Add Goyo and Limelight plugins for distraction-free writing in vim
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"""" Add python-mode plugin
Plugin 'python-mode/python-mode'
let g:pymode_python = 'python3'
let g:pymode_paths = ['/home/swati/Software/miniconda/miniconda3/bin/python']

"""" Add rainbow-paranthesis
Plugin 'kien/rainbow_parentheses.vim'

"""" Better Whitespace
Plugin 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=235

"""" Better cpp highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

"""" Hacker News
Plugin 'ryanss/vim-hackernews'

"""" vim-tmux navigator
Plugin 'christoomey/vim-tmux-navigator'
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"""" Better prose with writegood
Plugin 'davidbeckingsale/writegood.vim'

"""" Comment Toggle
Plugin 'kamwitsta/commentToggle'

"""" Surrounding with braces, quotes, paranthesis etc
Plugin 'tpope/vim-surround'

"""" Dim inactive windows/splits
Plugin 'blueyed/vim-diminactive'
hi ColorColumn ctermbg=233 guibg=#eee8d5
let g:diminactive_use_syntax = 1
