"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" PLUGINS (vim-plug) ------------------------------------------------------ {{{

" Remember to run ":PluginInstall" after changing plugins.
call plug#begin('~/.vim/plugged')

    " Bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Theme
    Plug 'tomasiser/vim-code-dark'
    "Plug 'dracula/vim'                             " a really good theme for neovim

    Plug 'preservim/nerdtree'                       " A file explorer for neovim(netrw comes as default for neovim)
    Plug 'ryanoasis/vim-devicons'                   " Devicon support for nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'dense-analysis/ale'                       " Asynchronous Lint Engine

    " Completion and tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " A fast code completion engine
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'honza/vim-snippets'                       " Snippets engine
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'SirVer/ultisnips'
    Plug 'preservim/nerdcommenter'                  " An easy way for commenting out lines
    Plug 'mhinz/vim-startify'                       " A really handy start page with lots of customizations

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    " Rust/Cargo
    Plug 'timonv/vim-cargo'

    " Terraform
    Plug 'hashivim/vim-terraform'

call plug#end()

" }}}

" SYSTEM ---------------------------------------------------------------- {{{

"set shell=/bin/zsh

" Use system clipboard
"set clipboard=unnamedplus

" Tell vim to recognize mouse commands in "all" modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"set ttymouse=xterm2

" Send more characters for redraws. Speed up scrolling in Vim. Improve fluidity
" of mouse commands, this isn't necessary but I believe improves performance
set ttyfast

" Don't mess up the indenting of pasted text
"set paste

" Map ctrl-c to copy a block of text selected by the mouse
vmap <C-C> "+y"

" Ensure backup dir exists
silent !mkdir ~/.vim/backup > /dev/null 2>&1

" Directory to store backup files.
set backupdir=~/.vim/backup

" Directory to store swap files.
set directory=~/.vim/backup

" }}}

" STYLING ---------------------------------------------------------------- {{{

" Highlight cursor line underneath the cursor horizontally.
"set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Add numbers to each line on the left-hand side.
set number

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Hide the double -- INSERT -- when using Airline
"set noshowmode

" Save on :make
"set autowrite

" Display relative row numbers
set relativenumber

" Set window title
"set title

" Set an 80 column border for good coding style
set cc=80

" Enable spell check (may need to download language package)
set spell spelllang=en_us

" }}}

" INDENTATION ------------------------------------------------------------- {{{

" Indent a new line the same amount as the line just typed
"set autoindent

" ???
"set noexpandtab

" Width (spaces) for autoindents.
set shiftwidth=4

" Number of columns (sapced) occupied by a tab.
set tabstop=4

" See multiple spaces as tabstops so <BS> does the right thing
set softtabstop=4

" "hen "smarttab" is off, "softtabstop" is used everywhere including line
" start. However, if "softtabstop" is equal to -1 then it is set to
" "shiftwidth" anyway. Hence there'll be no difference in setting "smarttab" on
" or off.
"set smarttab

" Set indentation level. Do NOT remove trailing space
"set list lcs=tab:\|\

" Folding method based on syntax
"set foldmethod=syntax
"set foldlevelstart=0

" }}}

" SEARCH ---------------------------------------------------------------- {{{

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters.
set smartcase

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Show matching words during a search.
set showmatch

" }}}

" OTHER ---------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax enable

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
"set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=5

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Changes split screen behavior with the command :split (split horizontally)
" and :vsplit (vertically). In this case, the screens will always split below
" the current screen and to the right.
set splitright
set splitbelow

" Disable creating swap file
"set noswapfile

" Hide unused buffers. Allow opening other windows with unsaved changes.
"set hidden

" Time in milliseconds to wait for commands to complete.
set ttimeoutlen=0

" modifies the auto-complete menu to behave more like an IDE.
"set completeopt=noinsert,menuone,noselect
" show replacements in a split screen, before applying to the file.
"set inccommand=split

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set custom key as the leader key.
let mapleader = ","

" Press \\ to jump back to the last cursor position.
"nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
"nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
"inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
"nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
"nnoremap o o<esc>
"nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
"nnoremap n nzz
"nnoremap N Nzz

" Yank from cursor to the end of line.
"nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <F5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <C-up> <C-w>+
noremap <C-down> <C-w>-
noremap <C-left> <C-w>>
noremap <C-right> <C-w><

"" move line or visually selected block - alt+j/k
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv" move split panes to left/bottom/top/right
"nnoremap <A-h> <C-W>H
"nnoremap <A-j> <C-W>J
"nnoremap <A-k> <C-W>K
"nnoremap <A-l> <C-W>L" move between panes to left/bottom/top/right
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"
"" Press i to enter insert mode, and ii to exit insert mode.
":inoremap ii <Esc>
":inoremap jk <Esc>
":inoremap kj <Esc>
":vnoremap jk <Esc>
":vnoremap kj <Esc>
"
"" open file in a text by placing text and gf
"nnoremap gf :vert winc f<cr>" copies filepath to clipboard by pressing yf
":nnoremap <silent> yf :let @+=expand('%:p')<CR>
"" copies pwd to clipboard: command yd
":nnoremap <silent> yd :let @+=expand('%:p:h')<CR>" Vim jump to the last position when reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal! g'\"" | endif
"endif

"
" Splits
"

" Resize splits
nnoremap <A-h> <C-w><
nnoremap <A-l> <C-w>>
nnoremap <A-j> <C-w>+
nnoremap <A-k> <C-w>-

"
" Terminal
"

" Use ESC for exiting terminal mode and allow moving to other splits
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>t :30split <Bar> :terminal<CR>
nnoremap <Leader>vt :vert 50split <Bar> :terminal<CR>

"
" Buffers (because are better than tabs)
"

" Allow moving to another buffer without saving the actual one
"set hidden
" Open a new empty buffer
nmap <leader>b :enew<CR>
" Move to next/previous buffer
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bs :ls<CR>


"
" Development
"

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
nmap <C-n> :cnext<CR>
nmap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
"augroup cursor_off
"    autocmd!
"    autocmd WinLeave * set nocursorline nocursorcolumn
"    autocmd WinEnter * set cursorline cursorcolumn
"augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    "colorscheme molokai
    colorscheme codedark

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
"set laststatus=2

" }}}

" THEME ------------------------------------------------------------ {{{

"
" Code Dark
"

" Apply the color set for dark screens. Not just the background of the screen, as it might look.
set background = "dark"

" Fix color schemes
if has('termguicolors')
    set termguicolors
endif

" Enable custom theme
colorscheme codedark

"
" Airline
"

" Enable airline support
let g:airline_theme = 'codedark'

" Display all buffers
let g:airline#extensions#tabline#enabled = 1

" Change to "straight" tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" The `unique_tail_improved` - another algorithm, that will smartly
" uniquify buffers names with similar filename, suppressing common
" parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Use powerline symbols
let g:airline_powerline_fonts = 1

" }}}

" TREE (NERDTree) ------------------------------------------------------------ {{{

"
" NERDTree
"

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Map the X key to toggle NERDTree open and close.
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

augroup NerdTreeSettings
    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p

    " Start NERDTree when Vim is started without file arguments.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

    " Start NERDTree when Vim starts with a directory argument.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Open the existing NERDTree on each new tab.
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END

"
" vim-nerdtree-syntax-highlight
"
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let s:golang_blue = "1F6F7D"

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['go'] = s:golang_blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" }}}

" AUTOCOMPLETION (COC) ------------------------------------------------------------ {{{

" You have to install language servers for the languages you want to use.
" :CocInstall coc-json coc-tsserver
:CocInstall coc-prettier

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Replaced by coc-snippets (see next section).
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format   :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold     :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR       :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add `:Prettier` command for running prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}

" SNIPPETS (COC-Snippets) ------------------------------------------------- {{{

" Install with ":CocInstall coc-snippets".

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" }}}

" GO (vim-go) ------------------------------------------------------------- {{{

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

let g:go_fmt_autosave = 0
let g:go_gopls_complete_unimported = 'gopls'

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

augroup Golang
	" Organize imports on save
	autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
	" Run all tests
	autocmd BufEnter *.go nmap <leader>t <Plug>(go-test)
	" Run current test only
	autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
	" Toggle the coverage profile for the current file
	autocmd BufEnter *.go nmap <leader>co <Plug>(go-coverage-toggle)
	" Info about func/type/var under the cursor
	autocmd BufEnter *.go nmap <leader>i <Plug>(go-info)
	" Info about implementations
	autocmd BufEnter *.go nmap <leader>ii <Plug>(go-implements)
	" Describe the func/type/var under the cursor
	autocmd BufEnter *.go nmap <leader>ci <Plug>(go-describe)
	autocmd BufEnter *.go nmap <leader>cc <Plug>(go-callers)
augroup END

" }}}

" Markdown ---------------------------------------------------------------- {{{

let g:mkdp_browser = 'firefox'
let g:mkdp_filetypes = ['markdown']

" }}}

" Terraform ---------------------------------------------------------------- {{{

let g:terraform_align = 1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
augroup Terraform
	autocmd BufRead,BufNewFile *.hcl set filetype=terraform
augroup END

" }}}

" Toml -------------------------------------------------------------------- {{{

augroup Toml
	autocmd FileType toml set expandtab
augroup END

" }}}

" Git Gutter -------------------------------------------------------------- {{{

" Disable GitGutter mappings since I need only a reference
" of added, modified, deleted lines in files
let g:gitgutter_map_keys = 0

" }}}
