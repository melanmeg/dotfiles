if &compatible  
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/toml/dein.toml'
let s:toml_file2 = fnamemodify(expand('<sfile>'), ':h').'/toml/dein2.toml'
let s:toml_file3 = fnamemodify(expand('<sfile>'), ':h').'/toml/dein3.toml'
let s:toml_file4 = fnamemodify(expand('<sfile>'), ':h').'/toml/denite.toml'
let s:toml_file5 = fnamemodify(expand('<sfile>'), ':h').'/toml/defx.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file) 
  call dein#load_toml(s:toml_file2)
  call dein#load_toml(s:toml_file3) 
  call dein#load_toml(s:toml_file4) 
  call dein#load_toml(s:toml_file5)
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
	call dein#install()
endif

runtime! ./rc/options.vim
runtime! ./rc/keymap.vim
runtime! ./rc/functions.vim
runtime! ./rc/lets.vim


