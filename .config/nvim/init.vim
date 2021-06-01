" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/vim-asterisk'
Plug 'morhetz/gruvbox'
  let g:gruvbox_transparent_bg=1

" Plug 'rhysd/clever-f.vim'
Plug 'RRethy/vim-illuminate'
Plug 'dense-analysis/ale'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'

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

" syntax js, ts, jsx, tsx
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

Plug 'jpalardy/vim-slime'
" color nested brackets.
Plug 'amdt/vim-niji'

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

" don't show statusline
set laststatus=0

colorscheme gruvbox

" Make Y behave like other capitals D, C
nnoremap Y y$

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
xnoremap s :s//g<Left><Left>

" split
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" window navigation with tab/ shift tab
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" fugitive mapping
nmap     <Leader>g :Gstatus<CR>gg<c-n>
" nnoremap <Leader>d :Gvdiff<CR>
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
" nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>

" fix syntax
nnoremap <Leader>s :syntax sync fromstart<CR>

" color nested brackets - amdt/vim-niji {{{
 let g:niji_dark_colours = [
     \ [ '81', '#5fd7ff'],
     \ [ '99', '#875fff'],
     \ [ '1',  '#dc322f'],
     \ [ '76', '#5fd700'],
     \ [ '3',  '#b58900'],
     \ [ '2',  '#859900'],
     \ [ '6',  '#2aa198'],
     \ [ '4',  '#268bd2'],
     \ ]
let g:niji_matching_filetypes = ['lisp', 'scheme', 'clojure', 'javascript']

" }}}

" slime {{{

let g:slime_default_config={'socket_name': 'default', 'target_pane': '{down-of}'}
let g:slime_paste_file=tempname()
let g:slime_target='tmux'
xmap <Leader>r <Plug>SlimeRegionSend
nmap <Leader>r <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig

" }}}

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
  nmap <buffer> m <Plug>(fern-action-mark:toggle)
  xmap <buffer> m <Plug>(fern-action-mark:toggle)
  " nmap <buffer> N <Plug>(fern-action-new-file)
  " nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> C <Plug>(fern-action-copy)
  nmap <buffer> A <Plug>(fern-action-new-path)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> M <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-rename)
  xmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> Y <Plug>(fern-action-yank)
  nmap <buffer> <nowait> y <Plug>(fern-action-yank:path)
  nmap <buffer> <nowait> d <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <nowait> h <Plug>(fern-action-leave)
  nmap <buffer> <nowait> l <Plug>(fern-action-enter)
  nmap <buffer> <nowait> <Enter> :set laststatus=2<CR><Plug>(fern-action-open:select):set laststatus=0<CR>
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

" keep .swp and backup file in tmp folder
set backupdir=/tmp//,.
set directory=/tmp//,.

" Semi-persistent undo
if has('persistent_undo')
  set undodir=/tmp,.
  set undofile
endif

" Enable syntax highlighting.
syntax on

"
" to format json buffer:
" :%!python3 -m json.tool
"

" autocmd vimenter * colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
