let mapleader = ','
let maplocalleader = ' '
set number
set encoding=utf-8


syntax on
set smarttab
set expandtab
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

set t_Co=256
set laststatus=2
set wrap
set tw=0
set backspace=indent,eol,start


set ruler
set pumheight=10
set showtabline=2

set noshowmode


" Search options

set ignorecase
"set smartcase

filetype plugin on
"" 获取当前路径，将$HOME转化为~
"function! CurDir()
"        let curdir = substitute(getcwd(), $HOME, "~", "g")
"        return curdir
"endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ \ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
"
"
"highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue

"set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
"set statusline+=%1*\ %<%F\                                "文件路径
"set statusline+=%2*\ %y\                                  "文件类型
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2
"set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)
"set statusline+=%9*\ col:%03c\                            "光标所在列
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom
"function! HighlightSearch()
"      if &hls
"          return 'H'
"      else
"          return ''
"      endif
"endfunction
"hi User1 ctermfg=white  ctermbg=darkred
"hi User2 ctermfg=blue  ctermbg=58
"hi User3 ctermfg=white  ctermbg=100
"hi User4 ctermfg=darkred  ctermbg=95
"hi User5 ctermfg=darkred  ctermbg=77
"hi User7 ctermfg=darkred  ctermbg=blue  cterm=bold
"hi User8 ctermfg=231  ctermbg=blue
""hi User9 ctermfg=#ffffff  ctermbg=#810085
"hi User0 ctermfg=yellow  ctermbg=138



au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


call plug#begin('~/.config/nvim/plugged')

" pretty dress
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
"Plug 'hardcoreplayers/dashboard-nvim'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'liuchengxu/vista.vim'

"move
Plug 'rhysd/accelerated-jk'
" dir tree
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'kristijanhusak/defx-icons'


" task like vscode
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'


" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" useful tools

"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'voldikss/vim-floaterm'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()



function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set termguicolors
set background=dark
"let ayucolor="mirage"
colorscheme nord


let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'cocstatus','readonly', 'filename', 'modified', 'method'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'method':'NearestMethodOrFunction'
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

"let g:lightline = {
	"\ 'colorscheme': 'wombat',
	"\ 'active': {
	"\   'left': [ [ 'mode', 'paste' ],
	"\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	"\ },
	"\ 'component_function': {
	"\   'cocstatus': 'coc#status'
	"\ },
	"\ }

  " Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline#bufferline#show_number = 2

let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#shorten_path = 1



let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }



"dashboard
"let g:dashboard_default_executive ='fzf'
"let g:dashboard_custom_shortcut={
      "\ 'last_session'       : 'SPC s l',
      "\ 'find_history'       : 'SPC f h',
      "\ 'find_file'          : 'SPC f f',
      "\ 'new_file'           : 'SPC c n',
      "\ 'change_colorscheme' : 'SPC t c',
      "\ 'find_word'          : 'SPC f a',
      "\ 'book_marks'         : 'SPC f b',
      "\ }

"let g:fzf_preview_window = 'right:60%'
"let g:dashboard_custom_section={
"\ 'find_files': [' Find Files'],
"\ 'book_marks': [' book_marks']
"\ }

"function! FIND_FILES()
""CocList files
"Files
"endfunction
"function! BOOK_MARKS()
""CocList files
"Marks
"endfunction
"let g:dashboard_custom_shortcut_icon['last_session'] = ' '
"let g:dashboard_custom_shortcut_icon['find_history'] = ''
"let g:dashboard_custom_shortcut_icon['find_file'] = ''
"let g:dashboard_custom_shortcut_icon['new_file'] = ''
"let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
"let g:dashboard_custom_shortcut_icon['find_word'] = ' '
"let g:dashboard_custom_shortcut_icon['book_marks'] = ''


" asynctasks 
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git','.svn','.root','.project','.hg','.projectile']

let g:asynctasks_term_pos = 'right'
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80

let g:asynctasks_term_reuse = 1




"fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"
"
"" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
 let g:mkdp_browser = 'surf'
"let g:mkdp_browser = 'surf'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-o> <Plug>MarkdownPreviewToggle


let g:table_mode_map_prefix = ' '
" Use this option to define the table corner character
let g:table_mode_corner = '|'
" Use this option to define the delimiter which used by
let g:table_mode_delimiter = ' '
"let g:table_mode_fillchar = ' '
let g:table_mode_syntax = 0



autocmd FileType markdown inoremap <buffer> <silent> ,, <++>
autocmd FileType markdown inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohl<CR>c4l
autocmd FileType markdown inoremap <buffer> <silent> ,s <Esc>/ <++><CR>:nohl<CR>c5l
autocmd FileType markdown inoremap <buffer> <silent> ,- ---
autocmd FileType markdown nnoremap <buffer> <silent> ,, :TableModeRealign<CR>
"function! s:isAtStartOfLine(mapping)
  "let text_before_cursor = getline('.')[0 : col('.')-1]
  "let mapping_pattern = '\V' . escape(a:mapping, '\')
  "let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  "return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
"endfunction

"inoreabbrev <expr> <bar><bar>
          "\ <SID>isAtStartOfLine('\|\|') ?
          "\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
"inoreabbrev <expr> __
          "\ <SID>isAtStartOfLine('__') ?
          "\ '<c-o>:silent! TableModeDisable<cr>' : '__'




" defx config


let g:defx_icons_enable_syntax_highlight = 0
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

let g:defx_icons_term_colors = {
  \ 'brown'       : 130,
  \ 'aqua'        : 66,
  \ 'blue'        : 67,
  \ 'darkBlue'    : 57,
  \ 'purple'      : 60,
  \ 'lightPurple' : 103,
  \ 'red'         : 131,
  \ 'beige'       : 137,
  \ 'yellow'      : 229,
  \ 'orange'      : 208,
  \ 'darkOrange'  : 166,
  \ 'pink'        : 205,
  \ 'salmon'      : 209,
  \ 'green'       : 65,
  \ 'lightGreen'  : 108,
  \ 'default'       : 'FF0000',
\ }

"call defx#custom#column('icon', {
		  "\ 'directory_icon': '▸',
		  "\ 'opened_icon': '▾',
		  "\ 'root_icon': ' ',
		  "\ })
    "  \ 'columns' : 'space:indent:icon:filename:type:size:time',
call defx#custom#option('_', {
      \ 'columns' : 'indent:icons:filename',
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'rightbelow',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
nmap <silent> <space>op :Defx<cr>

autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> i defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> .      defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-e>  defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> C defx#do_action('cd', defx#get_candidate().action__path)
  nnoremap <silent><buffer><expr> ma defx#do_action('new_file')
  nnoremap <silent><buffer><expr> mt defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> md defx#do_action('remove')
  nnoremap <silent><buffer><expr> mr defx#do_action('rename')
  nnoremap <silent><buffer><expr> mm defx#do_action('execute_command', 'xdg-open .')
  nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth - 10)
  nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth + 10)
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> mp defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> mv defx#do_action('preview')
  nnoremap <silent><buffer><expr> f defx#do_action('toggle_select')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', [['drop']])
endfunction




" Coc config

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

set timeoutlen=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"let g:UltiSnipsExpandTrigger = "<nop>"
"let g:UltiSnipsJumpForwardTrigger = '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:UltiSnipsRemoveSelectModeMappings = 0

"let g:completion_enable_snippet = "UltiSnips"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"nnoremap <leader>es :UltiSnipsEdit!<cr>
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <localleader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
xmap <space>sf  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
nmap <space>sf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <localleader>a  <Plug>(coc-codeaction-selected)
nmap <localleader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent><nowait> <localleader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <localleader>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <localleader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <localleader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <localleader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <localleader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <localleader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <localleader>p  :<C-u>CocListResume<CR>


" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction


function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" Keymapping for grep word under cursor with interactive mode
"nnoremap <silent> <Leader>gh :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
"nnoremap <silent> <Leader>w  :exe 'CocList -I --input='.expand('<cword>').' words'<CR>

let g:coc_global_extensions = ['coc-json','coc-tsserver','coc-yank','coc-translator','coc-tasks','coc-snippets','coc-cmake','coc-lists','coc-python','coc-html','coc-markdownlint','coc-texlab','coc-explorer']

nnoremap <silent><nowait> <localleader>l :<C-u>CocList<cr>
nnoremap <silent><nowait> <localleader>lb :<C-u>CocList buffers<cr>
nnoremap <silent><nowait> <localleader>lm :<C-u>CocList mru<cr>
"nnoremap <silent><nowait> <localleader>lf :<C-u>CocFzfList files<cr>
"nnoremap <silent><nowait> <localleader>lg :<C-u>CocList grep<cr>
nnoremap <silent><nowait> <localleader>lc :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <localleader>ld :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <localleader>lo :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <localleader>le :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <localleader>ls :<C-u>CocList symbols<cr>
nnoremap <silent><nowait> <localleader>lw :<C-u>CocList words<cr>

nnoremap <silent><nowait> <localleader>e  :<C-u>CocCommand explorer<CR>


"floatterm
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']
let g:floaterm_gitcommit = 'vsplit'
"nnoremap   <silent>   <localleader>t    :FloatermNew<CR>
"tnoremap   <silent>   <localleader>t    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <   :FloatermToggle<CR>
tnoremap   <silent>   <   <C-\><C-n>:FloatermToggle<CR>

" custom map
nnoremap <C-p> <C-w>p
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap Q :q<CR>
nnoremap S :w<CR>
nnoremap T :set splitbelow<CR>:new term://$SHELL<CR>:res 6<CR>
tmap <ESC> <C-\><C-n>

" copy to system clipboard
vnoremap Y "+y

noremap H ^
noremap L $
" Search
map <localleader><CR> :nohl<CR>

"nnoremap dd O<esc>jddk
" disable default key s
"
map s <nop>

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"nmap j <Plug>(accelerated_jk_gj_position)
"nmap k <Plug>(accelerated_jk_gk_position)
"
"Split
nmap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nmap sj :set splitbelow<CR>:split<CR>
nmap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nmap sl :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
nmap <LEADER><up> :res +5<CR>
nmap <LEADER><down> :res -5<CR>
nmap <LEADER><left> :vertical resize-5<CR>
nmap <LEADER><right> :vertical resize+5<CR>


nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>


"build
nnoremap <space>b :CocList tasks<CR>
" popup
nmap <localleader>t <Plug>(coc-translator-p)
vmap <localleader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>r <Plug>(coc-translator-r)
vmap <Leader>r <Plug>(coc-translator-rv)

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <localleader>f  :<C-u>Vista finder coc<cr>
nnoremap <silent> <localleader>v  :<C-u>Vista!!<cr>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'floating-height': -10,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'floating-height': -10,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'a': {
\     'quit-on-open': v:true,
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename growRight 1 omitCenter 1][modified]',
\     'file-child-labeling-template': '[fullpath][size][modified][readonly]',
\   },
\   'b': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename growRight 1 omitCenter 1][size]',
\     'file-child-labeling-template': '[fullpath][size][created][modified][accessed][readonly]',
\   }
\ }
let g:indentLine_fileTypeExclude = ['coc-explorer']

"comment
nmap <localleader>m <plug>NERDCommenterToggle
vmap <localleader>m <plug>NERDCommenterToggle
"nnoremap <leader>m <Plug>NERDCommenterComment

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)


nnoremap <silent> <space>kb :bd<CR>


nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


" This selects the next closest text object.
"map <SPACE> <Plug>(wildfire-fuel)
"
" " This selects the previous closest text object.
"vmap <C-SPACE> <Plug>(wildfire-water)"


"nnoremap <Leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		":res -15
		:term ./%<
	elseif &filetype == 'cmake'
		set splitbelow
		exec "!cd build && cmake ..&&make"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc
