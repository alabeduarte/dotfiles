" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | UpdateRemotePlugins | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Vim plugin to interact with tmux
Plug 'benmills/vimux'

" Shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" Fuzzy file, buffer, mru, tag, etc finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Vim plugin for the_silver_searcher, 'ag'
Plug 'rking/ag.vim'

" Is all about "surroundings": parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'

" Provides insert mode auto-completion for quotes, parens, brackets, etc
Plug 'Raimondi/delimitMate'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" Vim plugin to list, select and switch between buffers.
Plug 'jeetsukumaran/vim-buffergator'

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'

" Vim Markdown runtime files
Plug 'tpope/vim-markdown'

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Auto-format Javascript with ESLint
Plug 'w0rp/ale'

" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'yuezk/vim-js'

" React JSX syntax highlighting and indenting for vim.
Plug 'maxmellon/vim-jsx-pretty'

" TypeScript support for vim
Plug 'HerringtonDarkholme/yats.vim'

" Provides support for expanding abbreviations
Plug 'mattn/emmet-vim'

" HTML5 omnicomplete and syntax
Plug 'othree/html5.vim'

" Vim syntax for LESS (dynamic CSS)
Plug 'groenewege/vim-less'

" Syntax highlighting for Dockerfiles
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" Basic vim/terraform integration
Plug 'hashivim/vim-terraform'

" Precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

" -----------------------------------------------------------------------------
" Plugin configurations
" -----------------------------------------------------------------------------

filetype plugin indent on
syntax on

" Start depoplete (auto-complete) at startup
let g:deoplete#enable_at_startup = 1

" This instructs deoplete to use omni completion for Go files.
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" MaxMEllon/vim-jsx-pretty
" Colorful style (vim-javascript only)
let g:vim_jsx_pretty_colorful_config = 1

" junegunn/fzf
" Enable fzf in vim
set rtp+=/usr/local/opt/fzf

" junegunn/fzf
" Enable CTRL-P
nnoremap <C-p> :Files<CR>

" rking/ag
" Content search
nnoremap \ :Ag<SPACE>

" -----------------------------------------------------------------------------
" Key binding
" -----------------------------------------------------------------------------

" Leader
let mapleader=","

" Clipboard settings
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Quickfix close
nnoremap <silent> <leader>a :cclose<CR>:lclose<CR>

" Toggle NERDTree
map <leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>

" Run last command
map <leader>rl :VimuxRunLastCommand<CR>"

" Go to definition
map <leader>g :ALEGoToDefinition<CR>

" -----------------------------------------------------------------------------
" Common editor configs
" -----------------------------------------------------------------------------

autocmd BufWritePre * :%s/\s\+$//e

set autowriteall
set noswapfile
set number
set tabstop=2 shiftwidth=2 expandtab
set backspace=2
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
set linebreak
set textwidth=80
set colorcolumn=80
set colorcolumn=+1

" -----------------------------------------------------------------------------
" Color Scheme
" -----------------------------------------------------------------------------
try
  syntax enable
  set background=dark
  colorscheme solarized
catch
endtry

" Match wombat colors in nerd tree
hi Directory guifg=#8ac6f2

" Searing red very visible cursor
hi Cursor guibg=red

" Use same color behind concealed unicode characters
hi clear Conceal

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" -----------------------------------------------------------------------------
" NERDTree Icons
" -----------------------------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 0
let NERDTreeMinimalUI = 1

" -----------------------------------------------------------------------------
" Go code format
" -----------------------------------------------------------------------------
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 0

" -----------------------------------------------------------------------------
" Javascript code format
" -----------------------------------------------------------------------------
let g:ale_fixers = {
      \'javascript': ['prettier', 'eslint'],
      \'javascriptreact': ['prettier', 'eslint'],
      \'typescript': ['prettier', 'eslint'],
      \'typescriptreact': ['prettier', 'eslint']
      \}
let g:ale_fix_on_save = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 0
let g:ale_completion_tsserver_autoimport = 1
set omnifunc=ale#completion#OmniFunc
