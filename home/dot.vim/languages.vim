""" HTML
aug html
	" *.html is almost always Twig or Jinja2; this will work fine with
	" vanilla HTML as well
	au FileType html set filetype=htmldjango
	au FileType html,htmldjango,eruby,haml setlocal textwidth=120
aug END


""" Haskell
aug html
	au FileType haskell setlocal expandtab ts=4 sts=4 sw=4
aug END


""" PHP
" highlighting parent error ] or )
let php_parent_error_close=1
let php_parent_error_open=1

aug php
	au BufNewFile *.php exe "normal O<?php"
aug END


""" Scheme
let g:is_chicken=1


""" Config files, etc.
au BufNewFile,BufRead
	\ [Mm]akefile*,
	\crontab*,
	\*rc,
	\*.conf,*.ini,*.cfg,*.rc,
	\ set ts=8 sts=8 sw=8


""" Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown