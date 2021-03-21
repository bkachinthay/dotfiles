" vim-plug
call plug#begin('~/.vim/plugged')
" Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/vim-asterisk'
Plug 'morhetz/gruvbox'
" Plug 'gruvbox-community/gruvbox'
  let g:gruvbox_transparent_bg=1

" Plug 'rhysd/clever-f.vim'
Plug 'RRethy/vim-illuminate'
" Plug 'w0rp/ale'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'mtth/scratch.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-fugitive'
" https://thoughtbot.tumblr.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits
Plug 'christoomey/vim-tmux-navigator'

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  let g:undotree_WindowLayout = 2
  nnoremap U :UndotreeToggle<CR>

Plug 'junegunn/vim-peekaboo'
" Integrate fzf with Vim.
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

Plug 'tmsvg/pear-tree'
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1

" Plug 'https://github.com/alok/notational-fzf-vim'

" syntax js, ts, jsx, tsx
" Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ianks/vim-tsx'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
 " Plug 'edkolev/tmuxline.vim'
call plug#end()

" Debugging helpers
" https://github.com/statico/dotfiles/blob/42232002260d2a6e102b884e419ddae1a9238fe2/.vim/vimrc#L163
autocmd BufEnter *.py iabbr xxx print('XXX ',
autocmd BufEnter *.py iabbr yyy print('YYY ',
autocmd BufEnter *.py iabbr zzz print('ZZZ ',
autocmd BufEnter *.js iabbr xxx console.log('XXX ',
autocmd BufEnter *.js iabbr yyy console.log('YYY ',
autocmd BufEnter *.js iabbr zzz console.log('ZZZ ',
autocmd BufEnter *.jsx iabbr xxx console.log('XXX ',
autocmd BufEnter *.jsx iabbr yyy console.log('YYY ',
autocmd BufEnter *.jsx iabbr zzz console.log('ZZZ ',
autocmd BufEnter *.ts iabbr xxx console.log('XXX ',
autocmd BufEnter *.ts iabbr yyy console.log('YYY ',
autocmd BufEnter *.ts iabbr zzz console.log('ZZZ ',
autocmd BufEnter *.tsx iabbr xxx console.log('XXX ',
autocmd BufEnter *.tsx iabbr yyy console.log('YYY ',
autocmd BufEnter *.tsx iabbr zzz console.log('ZZZ ',

" basics
let mapleader=" "
let maplocalleader=" "

set number relativenumber
set clipboard=unnamedplus
filetype plugin indent on
highlight Normal ctermbg=None

" highlight current line where cursor is
set cul

" split resize through mouse
set mouse=n
" set ttymouse=xterm2

" tab to space
set expandtab
set shiftwidth=2

colorscheme gruvbox

" Make Y behave like other capitals D, C
nnoremap Y y$

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
xnoremap S :s//g<Left><Left>

" split
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" window navigation with tab/ shift tab
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" map <Leader>h <C-w>h
" map <Leader>j <C-w>j
" map <Leader>k <C-w>k
" map <Leader>l <C-w>l
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <Leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <Leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <Leader>l :TmuxNavigateRight<cr>
nnoremap <silent> <Leader>p :TmuxNavigatePrevious<cr>

" fugitive mapping
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gvdiff<CR>
nnoremap <nowait> <Leader>dd :Gvdiff<CR>

" diff mapping
nnoremap <Leader>dw :windo diffthis<CR>
nnoremap <Leader>do :windo diffoff<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dp :diffput<CR>

" open an empty buffer in vertical split
nnoremap <Leader>v :vnew<CR>

" equilize vim splits
nnoremap <Leader>= <C-w>=

" zoom a split(open current split in new tab)
nnoremap <silent> <Leader>z :tab split<CR>

" quickly switch to previous buffer
nnoremap <Leader><Leader> <C-^>
" nnoremap <Leader><Leader> :b#<CR>

" quick exit, save
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w<CR>

" open config
nnoremap <Leader>ee :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>et :e ~/.tmux.conf<CR>
nnoremap <Leader>ez :e ~/.zshrc<CR>

" source vim config
nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>

" fix syntax
nnoremap <Leader>s :syntax sync fromstart<CR>

"Nerd tree
let g:NERDTreeMinimalUI=1

" nerd tree {{{

" Open current file in nerdtree. close if nerdtree is already open.
" nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" map <leader>n :NERDTreeToggle<CR>

" use nerdtree like netw/vinegar
" nnoremap <silent> _ :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
" nmap <buffer> <expr> - g:NERDTreeMapUpdir

" }}}
"

" fern {{{

let g:fern#disable_default_mappings             = 1
let g:fern#disable_drawer_auto_quit             = 1
let g:fern#disable_viewer_hide_cursor           = 1
let g:fern#mark_symbol                          = '●'
let g:fern#renderer#default#collapsed_symbol    = '▷ '
if empty(eval('$VTE_VERSION'))
    let g:fern#renderer#default#expanded_symbol = '◢ '
else
    let g:fern#renderer#default#expanded_symbol = '▼ '
endif
let g:fern#renderer#default#leading             = ' '
let g:fern#renderer#default#leaf_symbol         = ' '
let g:fern#renderer#default#root_symbol         = '~ '

noremap <silent> <Leader>n :Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=
noremap <silent> - :Fern %:h -reveal=%<CR>

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> o <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> go <Plug>(fern-my-open-expand-collapse)<C-w>p
  " nmap <buffer> l <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> m <Plug>(fern-action-mark:toggle)j
  xmap <buffer> m <Plug>(fern-action-mark:toggle)j
  " nmap <buffer> N <Plug>(fern-action-new-file)
  " nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> C <Plug>(fern-action-copy)
  nmap <buffer> A <Plug>(fern-action-new-path)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> M <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> Y <Plug>(fern-action-yank)
  nmap <buffer> <nowait> y <Plug>(fern-action-yank:path)
  nmap <buffer> <nowait> d <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <nowait> h <Plug>(fern-action-leave)
  nmap <buffer> <nowait> l <Plug>(fern-action-enter)
  nmap <buffer> <nowait> - <Plug>(fern-action-leave)
endfunction

augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Disable Netrw.
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction
" }}}

" fern git status {{{

let g:fern_git_status#disable_ignored    = 1
" let g:fern_git_status#disable_untracked  = 1
" let g:fern_git_status#disable_submodules = 1
" let g:fern_git_status#indexed_character  = '■'
" let g:fern_git_status#stained_character  = '■'

" }}}

" FZF map
" nnoremap <silent> <Leader>f :Files -m<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" copy and paste
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

"-----------------------------
" Increment and decrement mappings
"-----------------------------
" nnoremap <Leader>+ <C-a>
" nnoremap <Leader>- <C-x>
" xnoremap <Leader>+ g<C-a>
" xnoremap <Leader>- g<C-x>

 " pas for notational fzf
" \   'typescript': ['eslint', 'tslint', 'tsserver'],
" \   'typescript.tsx': ['eslint', 'tslint', 'tsserver'],
" let g:nv_search_paths = ['~/notes']
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint' ],
\   'typescript.tsx': ['eslint'],
\   'json': ['eslint'],
\   'css': ['eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescript.tsx': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'css': ['prettier', 'eslint'],
\}
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'typescript': ['prettier'],
" \   'typescript.tsx': ['prettier'],
" \   'json': ['prettier'],
" \   'css': ['prettier'],
" \}

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--config ~/.prettierrc.js'
let g:ale_typescript_prettier_options = '--config ~/.prettierrc.js'
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_javascript_prettier_use_global = 1

" highlight yanked text {{{
" if any issue replace with https://github.com/machakann/vim-highlightedyank
if exists('##TextYankPost')
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
  augroup END
endif
" }}}

"" airline {{{
let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" air-line

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Airline Themes
" let g:airline_theme='dark'
" let g:airline_theme='badwolf'
" let g:airline_theme='ravenpower' let g:airline_theme='simple'
" let g:airline_theme='term'
" let g:airline_theme='ubaryd'
" let g:airline_theme='laederon'
" let g:airline_theme='kolor'
" let g:airline_theme='molokai'
" let g:airline_theme='powerlineish'
" let g:airline_theme='gruvbox'
let g:airline_theme='base16'
" }}}

" keep .swp and backup file in tmp folder
set backupdir=/tmp//,.
set directory=/tmp//,.

" Semi-persistent undo
if has('persistent_undo')
  set undodir=/tmp,.
  set undofile
endif

" scratch params
" let g:scratch_persistence_file = '~/.config/nvim/scratch.txt'

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" " Enable 24-bit true colors if your terminal supports it.
" if (has("termguicolors"))
"   " https://github.com/vim/vim/issues/993#issuecomment-255651605
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"   set termguicolors
" endif

" Enable syntax highlighting.
syntax on

"
" to format json buffer:
" :%!python3 -m json.tool
"

" autocmd vimenter * colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
