"----------------------------------------
"      autocmd
"----------------------------------------
augroup fileTypeIndent
  autocmd!
  autocmd BufRead,BufNewFile *.py setfiletype python
augroup END

augroup my_cursorline
  autocmd!
  autocmd BufNewFile,BufRead,VimEnter * call s:set_cursorline()
  autocmd BufWritePost *vimrc call s:set_cursorline()
  function! s:set_cursorline()
      hi clear CursorLine
      hi CursorLineNr ctermbg=DarkGreen
      hi Error ctermfg=Black
  endfunction
augroup END

augroup vimrc_filetype
	autocmd!
	autocmd FileType zsh let g:cheatsheet#cheat_file = '~/.cheatsheet.txt'
augroup END
