" Quickly jump to recently used filed
nnoremap <Leader>o :browse oldfiles<CR>

" Reload config
nnoremap <Leader>r :source $MYVIMRC<CR>

" Close help, rather than open help
nnoremap <F1> :helpclose<CR>
inoremap <F1> <C-o>:helpclose<CR>

nnoremap <F1> :buffers<CR>
nnoremap <F2> :registers<CR>
nnoremap <F3> :UndotreeToggle<CR>
"nnoremap <F4> :SyntasticToggleMode<CR>
nnoremap <F4> :ALEToggle<CR>
"nnoremap <F5> :GitGutterToggle<CR>
nnoremap <F6> :TricycleToggle<CR>

nnoremap <F9> :set shiftround!<CR>:set shiftround?<CR>
nnoremap <F10> :set list!<CR>:set list?<CR>
nnoremap <F11> :set cursorcolumn!<CR>:set cursorcolumn?<CR>
nnoremap <F12> :set paste!<CR>:set paste?<CR>

" Make sure that <F12> also works when set paste is enabled
set pastetoggle=<F12>

" Enable spell check, switch languages
nnoremap <Leader>ss :set spell!<CR>:set spell?<CR>
nnoremap <Leader>sn :set spelllang=nl<CR>
nnoremap <Leader>se :set spelllang=en_gb<CR>
nnoremap <Leader>su :set spelllang=en_us<CR>
nnoremap <Leader>sd :set spelllang=de_de<CR>

" Show all matches of word under cursor
nnoremap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr . "[\t"<CR>

" Use <C-l> to clear some highlighting
nnoremap <silent> <C-l> :nohlsearch<CR>:setl nolist nospell<CR>:diffupdate<CR>:syntax sync fromstart<CR><C-l>

" We don't need no stinkin' ex mode; use it for formatting
noremap Q gq

" Interface with system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Indent in visual and select mode automatically re-selects
vnoremap > >gv
vnoremap < <gv

" Use visual movement rather than line movement
nnoremap k gk
nnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" gf opens in a tab
nnoremap gf <C-w>gf
vnoremap gf <C-w>gf

" Home works like 0 if already at start of a line, and ^ otherwise.
" Adapted from: http://vim.wikia.com/wiki/VimTip315
noremap <expr> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Workaround to map <Home> in xterm outside of tmux
if &term == "xterm-256color"
	set <Home>=OH
	set <xHome>=OH
endif

" Replace the current line with the unnamed register without affecting any
" register.
" TODO: Check out: http://www.vim.org/scripts/script.php?script_id=2703
nnoremap RR "_ddP

" I often mistype this :-/
cabbr Set set
cabbr Help help

" My fingers just can't get this stupid thing right :-/
iabbr teh the
iabbr Teh The
iabbr 1= !=

" Make it easier to deal with the location list; these are right, left, up, and
" down arrow keys with Control. Using <C-Up> etc. doesn't seem to work.
nnoremap <expr> [C len(filter(getloclist(0), {i, l -> l['lnum'] == line('.')})) ? ":lnext<CR>" : ":ll<CR>"
nnoremap [D :lprev<CR>
nnoremap [A :lopen<CR>
nnoremap [B :lclose<CR>
nnoremap <expr> [1;5C len(filter(getloclist(0), {i, l -> l['lnum'] == line('.')})) ? ":lnext<CR>" : ":ll<CR>"
nnoremap [1;5D :lprev<CR>
nnoremap [1;5A :lopen<CR>
nnoremap [1;5B :lclose<CR>

" From https://github.com/mhinz/vim-galore#tips-1
" Edit macro: "q<leader>m to edit q.
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
