""" -----------------------------------------
""" --------- Map leader to space -----------
""" -----------------------------------------
noremap <Space> <NOP>
set notimeout
let mapleader=" "

""" -----------------------------------------
""" --------------- Plugins -----------------
""" -----------------------------------------

" easymotion
" -- jump around file
" -- https://github.com/AlexPl292/IdeaVim-EasyMotion
" Plug 'easymotion/vim-easymotion'
" set g:EasyMotion_do_mapping=0
" map f <Plug>(easymotion-bd-f)
" map F <Plug>(easymotion-jumptoanywhere)
" map t <Plug>(easymotion-bd-w)
" map T <Plug>(easymotion-bd-W)

" sneak
" -- sS become filewide fF but with two characters
" -- https://github.com/Mishkun/ideavim-sneak#usage
Plug 'justinmk/vim-sneak'
vunmap S

" surround
" -- visual mode S" = surround with "
" -- ds" = delete surrounding "
" -- https://github.com/tpope/vim-surround/blob/master/doc/surround.txt
Plug 'tpope/vim-surround'

" NERDTree
" -- project pane has vim controls
" -- https://github.com/JetBrains/ideavim/wiki/NERDTree-support
Plug 'preservim/nerdtree'

" multiple-cursors
" -- TODO find out what it does
" -- https://github.com/terryma/vim-multiple-cursors/blob/master/doc/multiple_cursors.txt
Plug 'terryma/vim-multiple-cursors'

" commentary
" -- TODO find out what it does
" -- https://github.com/tpope/vim-commentary/blob/master/doc/commentary.txt
" Plug 'tpope/vim-commentary'

" ReplaceWithRegister
" -- TODO find out what it does
" -- https://github.com/vim-scripts/ReplaceWithRegister/blob/master/doc/ReplaceWithRegister.txt
" Plug 'vim-scripts/ReplaceWithRegister'

" argtextobj
" -- via = select argument
" -- daa = delete argument
" -- https://www.vim.org/scripts/script.php?script_id=2699
Plug 'vim-scripts/argtextobj.vim'
let g:argtextobj_pairs="(:),<:>"

" exchange
" -- cxiw + cxiw = exchange word with other word
" -- visual mode C to select word
" -- https://github.com/tommcdo/vim-exchange/blob/master/doc/exchange.txt
Plug 'tommcdo/vim-exchange'
vmap C <Plug>(Exchange)
unmap X

" textobj-entire
" -- vie = entire file
" -- https://github.com/kana/vim-textobj-entire/blob/master/doc/textobj-entire.txt
Plug 'kana/vim-textobj-entire'

" highlightedyank
" -- https://github.com/machakann/vim-highlightedyank/blob/master/doc/highlightedyank.txt
Plug 'machakann/vim-highlightedyank'

" vim-paragraph-motion
" -- quality of life change where { and } match empty lines with only whitespace
" -- https://github.com/dbakker/vim-paragraph-motion#vim-paragraph-motion
Plug 'dbakker/vim-paragraph-motion'

" vim-indent-obj
" -- dii = delete inner indentation (inside of function)
" -- daI = delete around indentation (outside of function)
" -- probably best just to use Va{
" -- https://github.com/michaeljsmith/vim-indent-object/blob/master/doc/indent-object.txt
Plug 'michaeljsmith/vim-indent-object'

" matchit
" -- quality of life improvement to %
" -- https://github.com/adelarsq/vim-matchit/blob/master/doc/matchit.txt
Plug 'vim-matchit'


""" -----------------------------------------
""" -------------- Settings -----------------
""" -----------------------------------------

" use intellij smart join when doing J
set ideajoin

" relative line numbers - bad for screen sharing
set number
" set relativenumber

" show stuff in bottom left corner instead of doing annoying ping when command fails
set showmode
set visualbell

" Better searching (smartcase - incsearch - wrapscan)
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

" virtual edit -> possible to put cursor after last character
" paired with esc not moving cursor one to the left we have a combination that just makes sense
set ve=onemore
inoremap <ESC> <ESC>`^

" Refactor to normal mode this is essential to not losing your hair
set idearefactormode=keep
map <S-R> <Action>(RenameElement)
imap <S-F6> <c-o><Action>(RenameElement)
nmap <S-F6> <Action>(RenameElement)
vmap <S-F6> <Action>(RenameElement)

" Scrolling ((C-u C-d M H L zb zt zm))
set scrolloff=8
noremap  <PageUp>   <c-u>zz
inoremap <PageUp>   <c-o>5<c-u><c-o>zz
noremap  <PageDown> 5<c-d>zz
inoremap <PageDown> <c-o>5<c-d><c-o>zz
map zi <Action>(EditorIncreaseFontSize)
map zo <Action>(EditorDecreaseFontSize)
map z0 <Action>(EditorResetFontSize)

" More natural copy paste (only yYdD copy | pP and <C-V> paste)
nnoremap p "+p
vnoremap p "+p
nnoremap P "+P
vnoremap P "+P
nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
vnoremap Y "+Y
nnoremap d "+d
vnoremap d "+d
nnoremap D "+D
vnoremap D "+D

" unmap Shift+Enter
noremap <S-CR> <CR>
inoremap <S-CR> <CR>

" Tab left right
nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> <Action>(EditorIndentSelection)
vmap <S-Tab> <Action>(EditorUnindentSelection)

" Alternate moving
noremap [ [m
noremap ] ]M
noremap ( [b
noremap ) [w

" home/end
noremap  <home> ^
inoremap <home> <c-o>^
noremap  <end>  $
inoremap <end>  <c-o>$
noremap H ^
noremap L $

noremap Q ZZ

""" -----------------------------------------
""" ----------- Leader mappings -------------
""" -----------------------------------------

" IdeaVim
noremap <leader>v <nop>
noremap <leader>vv :source ~/.config/avim/.vimrc<CR>
noremap <leader>ve      :e ~/.config/avim/.vimrc<CR>
map <leader>vt <Action>(VimFindActionIdAction)

" Substitutions
nnoremap <leader>s :%s//g<left><left>
vnoremap <leader>s :s//g<left><left>

" Find
noremap <leader>f <nop>
map <leader>ff <Action>(GotoFile)
map <leader>fa <Action>(GotoAction)
map <leader>fc <Action>(GotoClass)

" Find/Replace
map <leader>fh <Action>(Find)
map <leader>rh <Action>(Replace)
map <leader>fe <Action>(FindInPath)
map <leader>re <Action>(ReplaceInPath)
map <leader>fs <Action>(StructuralSearchPlugin.StructuralSearchAction)
map <leader>rs <Action>(StructuralSearchPlugin.StructuralReplaceAction)

" Run
noremap <leader>r <nop>
map <leader>rr <Action>(Run)
map <leader>rd <Action>(Debug)
map <leader>rp <Action>(Profile)
map <leader>ra <Action>(Rerun)
map <leader>rc <Action>(RunClass)
map <leader>rq <Action>(Stop)
map <leader>rf <Action>(RerunFailedTests)
map <leader>rb <Action>(CompileDirty)
map <leader>R  <Action>(ChooseRunConfiguration)

" Debug
noremap <leader>d <nop>
map <leader>db <Action>(ToggleLineBreakpoint)
map <leader>dp <Action>(ToggleLineBreakpoint)
map <leader>de <Action>(EditBreakPoint)
map <leader>dv <Action>(ViewBreakPoints)
map <leader>dt <Action>(ToggleTemporaryLineBreakpoint)
map <leader>ds <Action>(StepOver)
map <leader>dj <Action>(StepInto)
map <leader>dk <Action>(StepOut)
map <leader>dn <Action>(Resume)

" Extract variable
noremap m <nop>
map mv <Action>(IntroduceVariable)
map mm <Action>(ExtractMethod)
map mf <Action>(IntroduceField)
map mp <Action>(IntroduceParameter)
map mc <Action>(IntroduceConstant)
map mu <Action>(Unwrap)
map mi <Action>(Inline)
map me <Action>(EncapsulateFields)
map ms <Action>(MakeStatic)

" Goto remaps (sorted by handiness)
noremap gp <nop>
noremap gn <nop>
map gd <Action>(GotoDeclaration)
map gs <Action>(GotoSuperMethod)
map gi <Action>(GotoImplementation)
map gu <Action>(ShowUsages)
map gU <Action>(FindUsages)
map ga <Action>(Annotate)
map gt <Action>(GotoTypeDeclaration)
map ge <Action>(GotoNextError)

" Git
map gc  <Action>(Git.CompareWithBranch)
map gf  <Action>(Git.Fetch)
map gm  <Action>(Git.Merge)
map gb  <Action>(Git.Branches)
map gpl <Action>(Vcs.UpdateProject)
map gps <Action>(Vcs.Push)
map gnb <Action>(Git.CreateNewBranch)
map gpb :!git checkout -<cr>

" Commit
noremap <leader>c <nop>
map <leader>cc <Action>(Git.Commit.And.Push.Executor)<Action>(CheckinProject)
map <leader>ca <Action>(Vcs.ToggleAmendCommitMode)
map <leader>cu <Action>(Vcs.RollbackChangedLines)
map <leader>cr <Action>(ChangesView.Revert)

" Generate
map <leader>i <Action>(Generate)

" History
noremap <leader>h <nop>
map <leader>hl <Action>(LocalHistory.ShowHistory)
map <leader>hg <Action>(LocalHistory.ShowHistory)

" Reformatting
map <leader>l       <Action>(ReformatCode)
map <leader>L       <Action>(ShowReformatFileDialog)

" Toolbars
noremap <leader>p <nop>
map <leader>pp <Action>(ActivateProjectToolWindow)
map <leader>pc <Action>(Vcs.Show.Local.Changes)
map <leader>ps <Action>(Vcs.Show.Shelf)
map <leader>pb <Action>(ActivateBuildToolWindow)
map <leader>pd <Action>(ActivateDebugToolWindow)
map <leader>pr <Action>(ActivateRunToolWindow)
map <leader>pt <Action>(ActivateTerminalToolWindow)
map <leader>pg <Action>(ActivateVersionControlToolWindow)
map <leader>pf <Action>(ActivateFindToolWindow)

" Notifications
map <leader><ESC> <Action>(CloseAllNotifications):noh<cr>

""" -----------------------------------------
""" ---------- Control mappings -------------
""" -----------------------------------------

" use vim for all control commands (for windows users I recommend remapping intellij shortcuts to alt)
sethandler a:vim

" back/forward
map <c-i> <Action>(Forward)
map <c-o> <Action>(Back)

noremap <c-s> :w<cr>

" window split mappings - comes standard with ideavim
" CTRL+w s       -   Split current window horizontally
" CTRL+w v       -   Split current window vertically
" CTRL+w c       -   Close current window
" CTRL+w m       -   Move to window according to motion m
" CTRL+w o       -   Maximize current window (note: this overwrites your current window configuration)