call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'epilande/vim-react-snippets'
Plug 'habamax/vim-godot'
Plug 'tomlion/vim-solidity'
  Plug 'SirVer/ultisnips'
  Plug 'morhetz/gruvbox'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'airblade/vim-gitgutter' 
  Plug 'preservim/nerdcommenter'
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  Plug 'digitaltoad/vim-pug'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  "Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
 "Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

  "Plug 'pappasam/coc-jedi', { 'do': 'npm install --frozen-lockfile && npm build' }

  if has('nvim')

  inoremap <silent><expr> <c-space> coc#refresh()
else
"inoremap <silent><expr> <c-@> coc#refresh()
endif

map <leader>R : !python3 -m manim % -pql<CR> <CR>

" fzf "
let g:fzf_preview_window = ['right:50%','ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = []
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
"let g:coc_user_config = {}
"let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap gb <C-o>
nmap gf <C-i>
nmap gp :silent  :call GitDo() <CR><Esc> 
nmap ga :silent :call GitAdd() <CR>
nmap g<Right> <C-w>l
nmap g<Left> <C-w>h
nmap g<Up> <C-w>k
nmap g<Down> <C-w>j
nmap g>  <C-w>20><CR><Esc> <Esc>
nmap g<  <C-w>20<<CR><Esc> <Esc>
nmap g=  <C-w>=
nmap g+  <C-w>10+
nmap g-  <C-w>10-

"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

call plug#end()

" General Settings "
colorscheme gruvbox
set bg=dark
set smartindent
set nu
set tabstop=4 shiftwidth=4 expandtab
set so=999


nmap <Space> a
nmap s <C-w>
"nmap ZZ ""

"imap <Tab> <C-n>
"imap ff <Esc>
nnoremap <silent> <Leader>F :Files<CR>
"nnoremap F :Files<CR>
"nnoremap <silent> <Leader>S :Rg<CR>
nnoremap <Leader>L :Lines<CR>
nnoremap <Leader>B :Buffers<CR>
nmap  Sh :set syntax=html<CR>
nmap  Sr :set syntax=javascriptreact<CR>
"Input snippets
nmap Iv i<View></View><Esc>FwF>a
nmap It i<Text></Text><Esc>FwF>a

" Git Gutter Settings "
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

  " React Settings "
let g:UltiSnipsExpandTrigger="<C-l>"

" Auto Pairs Settings "
if !exists('g:AutoPairsShortcutJump')
  let g:AutoPairsShortcutJump = "jj"
endif
"COC nvim vscode mode"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. ???
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
" Leaders

nnoremap Ia iconst c = props => {return ()};<Esc>Fccw
nnoremap IA oconst c = props => {return ()};<Esc>Fccw
nnoremap Is iconst styles = StyleSheet.create({});F{a
nmap Ii iimport {} from '';<Esc>hi
nmap II o<Esc>Ii

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" vimspector "
 let g:vimspector_enable_mappings = 'HUMAN'
nmap <F5> <Plug>VimspectorContinue
" maximizer "
nnoremap m :MaximizerToggle<cr>


" Own "
set autoread
au FocusGained,BufEnter * :checktime

function! GitAdd()
  execute  "! git ls-files -m -o --exclude-standard | fzf -m | xargs git add"
endfunction
function! GitDo()
  execute  "! git do"
endfunction

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

set tags=tags
let g:godot_executable = '/home/aki/Downloads/Godot_v3.3.2-stable_x11.64'
'
" coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)



"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
     
let g:coc_snippet_next = '<tab>'
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

set noswapfile

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

map <leader>u wbveUb

autocmd FileType sql call SqlFormatter()
augroup end
function SqlFormatter()
    set noai
    " set mappings...
    map ,pt  :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
endfunction

