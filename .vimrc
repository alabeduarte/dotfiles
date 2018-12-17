set nocompatible
filetype off

" -----------------------------------------------------------------------------
" Key binding
" -----------------------------------------------------------------------------

" Leader
let mapleader=","

" Toggle NERDTree
map <leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>

" Run current rspecs
map <Leader>rs :call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
" Run rspecs
map <Leader>rb :call VimuxRunCommand("clear; bundle exec rspec ")<CR>

" Run all npm tests
map <Leader>nt :call VimuxRunCommand("clear; npm test ")<CR>

" Run last command
map <Leader>rl :VimuxRunLastCommand<CR>"

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
set textwidth=80
set linebreak
set colorcolumn=80

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
" Load Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'

" Vim plugin to interact with tmux
Plugin 'benmills/vimux'

" Shows a git diff in the gutter (sign column) and stages/undoes hunks
Plugin 'airblade/vim-gitgutter'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'

" Vim plugin for the_silver_searcher, 'ag'
Plugin 'rking/ag.vim'

" Lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'

" A syntax checking plugin for Vim
Plugin 'scrooloose/syntastic'

" Is all about "surroundings": parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-surround'

" Provides insert mode auto-completion for quotes, parens, brackets, etc
Plugin 'Raimondi/delimitMate'

" Wisely add "end" in ruby, endfunction/endif/more in vim script, etc
Plugin 'tpope/vim-endwise'

" Perform all your vim insert mode completions with Tab
Plugin 'ervandew/supertab'

" Pasting in Vim with indentation adjusted to destination context
Plugin 'sickill/vim-pasta'

" Contains snippets files for various programming languages
Plugin 'honza/vim-snippets'

" Vim plugin to list, select and switch between buffers.
Plugin 'jeetsukumaran/vim-buffergator'

" Better whitespace highlighting for Vim
Plugin 'ntpeters/vim-better-whitespace'

" Simpler way to use some motions in vim. It takes the <number> out of <number>w
" or <number>f{char} by highlighting all possible choices and allowing you to
" press one key to jump directly to the target
Plugin 'Lokaltog/vim-easymotion'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" Powerline, Unite, vim-startify and more
Plugin 'ryanoasis/vim-devicons'

" Vim Markdown runtime files
Plugin 'tpope/vim-markdown'

" Vim/Ruby Configuration Files
Plugin 'vim-ruby/vim-ruby'

" This is a massive (in a good way) Vim plugin for editing Ruby on Rails
" applications.
Plugin 'tpope/vim-rails'

" Vim configuration files for Elixir
Plugin 'elixir-lang/vim-elixir'

" Vim integration for the Elixir formatter
Plugin 'mhinz/vim-mix-format'

" Vim plugin for using Elixir's build tool, mix
Plugin 'mattreduce/vim-mix'

" Yet Another JavaScript Syntax for Vim
Plugin 'othree/yajs.vim'

" Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'pangloss/vim-javascript'

" CoffeeScript support for vim
Plugin 'kchmck/vim-coffee-script'

" React JSX syntax highlighting and indenting for vim.
Plugin 'mxw/vim-jsx'

" Provides support for expanding abbreviations
Plugin 'mattn/emmet-vim'

" HTML5 omnicomplete and syntax
Plugin 'othree/html5.vim'

" Vim syntax for LESS (dynamic CSS)
Plugin 'groenewege/vim-less'

" Custom Haskell Vimscripts
Plugin 'raichoo/haskell-vim'

" Extended Haskell Conceal feature for Vim
Plugin 'enomsg/vim-haskellConcealPlus'

" Completion plugin for Haskell, using ghc-mod
Plugin 'eagletmt/neco-ghc'

" Syntax highlighting for Dockerfiles
Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" Basic vim/terraform integration
Plugin 'hashivim/vim-terraform'

" Precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" -----------------------------------------------------------------------------
" Plugin configurations
" -----------------------------------------------------------------------------

filetype plugin indent on
syntax on

" vim-ruby/vim-ruby
" Enable Ruby syntax highlighting and indenting for .jbuilder files
au BufRead,BufNewFile *.jbuilder setfiletype ruby

" mxw/vim-jsx
" Enable JSX syntax highlighting and indenting for .js files
let g:jsx_ext_required = 0

" -----------------------------------------------------------------------------
" Fuzzy Search
" -----------------------------------------------------------------------------
let g:ctrlp_show_hidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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
let g:NERDTreeNodeDelimiter = "\u00a0"

" -----------------------------------------------------------------------------
" Code format
" -----------------------------------------------------------------------------
let g:mix_format_on_save = 1
