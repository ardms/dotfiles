"Use Vim settings, rather than Vi settings
set nocompatible
filetype off

"----------------------------------------------------------
" GENERAL
"----------------------------------------------------------
" Do not keep any history
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set noswapfile

" mouse support 
set mouse=a

" clipboard support
set clipboard+=unnamedplus

" Disable bells
set noerrorbells
set visualbell
set t_vb=

" Ignore case when searching
set ignorecase
set smartcase

" Set working directory same as file being edited
" set autochdir

" Needed for Deopleete and relavant plugins
set encoding=utf-8
set pyxversion=3

" Set , as the leader key
let mapleader = ","

" Add all directories under current directory recursively 
set path=.,,**

" Open splits on the right instead of the left
set splitright

"----------------------------------------------------------
" Terminal mode mappings  
"----------------------------------------------------------
tnoremap <Esc> <C-\><C-n>

"----------------------------------------------------------
" Plugin Managment 
"----------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('\Users\Aris.Dimopoulus/bin/nvim/plugged')

" Make sure you use single quotes

Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
"Plug 'Shougo/ddc.vim'
"Plug 'vim-denops/denops.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplestion from memory
Plug 'davidhalter/jedi-vim' " Autocomplestion for Python
" Plug 'Valloric/YouCompleteMe' " Autocomplestion for Python second option
Plug 'ayu-theme/ayu-vim' " colorscheme 
" Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine' " displaying thin vertical lines at each indentation level
Plug 'pangloss/vim-javascript' " Nice formating for Javascript files use <Ctr> x for autocompletion
Plug 'valloric/MatchTagAlways' " highlight Matching HTML Tags

" Initialize plugin system
call plug#end()


"----------------------------------------------------------
" LOOK AND FELL 
"----------------------------------------------------------
" Set the colorscheme and window transparency
colorscheme gruvbox
" set termguicolors
" let ayucolor="mirage"
" colorscheme ayu

" Show matching bracets
set showmatch

" Show ruler and command visual aid
set ruler
set showcmd

" Highlight the cursor line
set cursorline

" Show line number and listchars
set list
set nu

" Define statusline theme 
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1

" hi TabLineSel ctermfg=7 ctermbg=3
" hi TabLine ctermfg=7 ctermbg=6

" Vertical like at column 80
set colorcolumn=80

" Spesifics for indentLine plugin
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
set lcs+=space:·

" This is spesific for the MatchTagAlways plugin
" will allow the pluin to work in all tose file types
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript' : 1,
    \}

"-----------------------------------------------------------
" Python spesific PEP8 indentation
"-----------------------------------------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=79
set expandtab
"set autoindent
"set fileformat=unix

let g:python3_host_prog = 'C:\Users\Aris.Dimopoulus\Anaconda3\envs\venv_382\python.exe'

let g:pymode_python = 'python3'

"let g:ale_python_flake8_executable = 'python3'
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1

" Disable Python 2 support 
"let g:loaded_python_provider = 0

"-----------------------------------------------------------
" Python autocomplete 
"-----------------------------------------------------------
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" For deoplete use TAB to switch between options
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Atempts to make jedi plygin faster
let g:pymode_rope=0
let g:pymode_folding=0
let g:jedi#environment_path='C:\Users\Aris.Dimopoulus\Anaconda3\envs\venv_382\python.exe'
" Disable opening documentation window when autocompleting with jedi
set completeopt-=preview
" Disable popup window with option and arguments when autocompleting
let g:jedi#show_call_signatures=0
let g:jedi#use_splits_not_buffers="right"

"------------------------------------------------------------------------------
" Status line configuration 
"------------------------------------------------------------------------------
" format markers:
"   %t File name (tail) of file in the buffer
"   %m Modified flag, text is " [+]"; " [-]" if 'modifiable' is off.
"   %r Readonly flag, text is " [RO]".
"   %y Type of file in the buffer, e.g., " [vim]".
"   %= Separation point between left and right aligned items.
"   %l Line number.
"   %L Number of lines in buffer.
"   %c Column number.
"   %P percentage through buffer
set statusline=%{toupper(mode())}\|\ \~%t\ %m%r%y%=(ascii=\%03.3b,hex=\%02.2B)\ (%l/%L,%c)\ (%P)
set laststatus=2
" change highlighting based on mode
if version >= 700
  highlight statusLine cterm=bold ctermfg=7  ctermbg=3
  au InsertLeave * highlight StatusLine cterm=bold ctermfg=7 ctermbg=3
  au InsertEnter * highlight StatusLine cterm=bold ctermfg=7 ctermbg=6
endif

"------------------------------------------------------------------------------
" Change the color of the line numbers when in Incert mode 
"------------------------------------------------------------------------------
" Default Colors for CursorLine and Cursor
" highlight  CursorLine ctermfg=7  ctermbg=grey

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLineNr cterm=bold ctermfg=6


" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLineNr cterm=bold ctermfg=None

"------------------------------------------------------------------------------
" General Snippets 
"------------------------------------------------------------------------------
"Add Python hidder every time a new python file is cretaed
autocmd BufNewFile *.py -1r C:\Users\Aris.Dimopoulus\bin\nvim\Python_File_header.txt

" Add comment section every time you type <leader>pc
nnoremap <leader>pc :-1read C:\Users\Aris.Dimopoulus\bin\nvim\Python_comment.txt<CR>jla

"----------------------------------------------------------
" This litle snipet found in stackoverflow will create a 
" nice looking tabline with the addition of a + if changes
" have been made to the file
"----------------------------------------------------------
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#' " WildMenu
    else
      let s .= '%#Title#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T '
    " set page number string
    let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . ', ' " pathshorten(bufname(b))
      endif
      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= ' %#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%T'
  " right-aligned close button
  " if tabpagenr('$') > 1
  "   let s .= '%=%#TabLineFill#%999Xclose'
  " endif
  return s
endfunction
