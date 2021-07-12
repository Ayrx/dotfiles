if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged/')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/Vimjas/vim-python-pep8-indent.git'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'souffle-lang/souffle.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'

call plug#end()

" Auto reload NeoVim config
autocmd! BufWritePost init.vim,.vimrc source %

" General Configurations
syntax on
syntax sync fromstart
set ruler
set number
set backspace=2
set colorcolumn=80
set updatetime=100
set hidden
set autoread

filetype on
filetype plugin on
filetype indent on

" Colors
let airline_theme='onedark'
colorscheme onedark
set background=dark
highlight ColorColumn ctermbg=7

" Ignore files and directories
set wildignore+=*.pyc,*/build/*,*.o,*/node_modules/*,*/venv/*,*/target/*

" Configure gitgutter
let g:gitgutter_enabed = 1
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Strip trailing whitespaces on write
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Configure Coc
" Reenable this config once neovim 0.5.0 is released
" setlocal tagfunc=CocTagFunc

"Configure Rust
let g:rustfmt_command = "rustfmt +stable"
let g:rustfmt_autosave_if_config_present = 1

"Configure fzf
nnoremap <silent> <C-p> :Files<CR>

set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab

autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
