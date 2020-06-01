"-------------------------------------------------
" Auto-install vim-plug
"-------------------------------------------------

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'
    "Plug 'haishanh/night-owl.vim'
    Plug 'ayu-theme/ayu-vim' 
	"Plug 'joshdick/onedark.vim' 
	Plug 'airblade/vim-rooter'	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"--------------------------------------------------
" Automatically install missing plugins on startup
"--------------------------------------------------

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
