" clear all previous mappings for good measure
mapclear
nmapclear
vmapclear
xmapclear
smapclear
omapclear
imapclear
cmapclear

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
" -- I should probably look into it more but for now it works
" -- https://github.com/AlexPl292/IdeaVim-EasyMotion
" let g:EasyMotion_do_mapping=0
" let g:EasyMotion_startofline=0
" Plug 'easymotion/vim-easymotion'
" set easymotion
" map f <Plug>(easymotion-bd-f)
" map F <Plug>(easymotion-bd-jk)

" sneak
" -- fF become filewide but with two characters
" -- disabled cause a bit buggy atm
" -- https://github.com/Mishkun/ideavim-sneak#usage
" Plug 'justinmk/vim-sneak'
" set sneak
" unmap s
" unmap S
" map f <Plug>(sneak-s)
" map F <Plug>(sneak-S)

" surround
" -- visual mode S" = surround with "
" -- ds" = delete surrounding "
" -- https://github.com/tpope/vim-surround/blob/master/doc/surround.txt
Plug 'tpope/vim-surround'

" NERDTree
" -- project pane has vim controls
" -- laggy and weird controls... ill use arrow keys thanks
" -- https://github.com/JetBrains/ideavim/wiki/NERDTree-support
" Plug 'preservim/nerdtree'

" multiple-cursors
" -- TODO find out what it does
" -- https://github.com/terryma/vim-multiple-cursors/blob/master/doc/multiple_cursors.txt
Plug 'terryma/vim-multiple-cursors'

" ReplaceWithRegister
" -- p in normal mode becomes replace with register. e.g. piw becomes short for "_diwp
" -- disabled for now cause other vims
" -- https://github.com/vim-scripts/ReplaceWithRegister/blob/master/doc/ReplaceWithRegister.txt
" Plug 'vim-scripts/ReplaceWithRegister'
" nnoremap p <nop>
" nmap p  <Plug>ReplaceWithRegisterOperator
" nnoremap pp p

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
set norelativenumber

" show stuff in bottom left corner instead of doing annoying ping when command fails
set showmode
set visualbell

" Better searching (smartcase - wrapscan)
set ignorecase
set smartcase
set wrapscan
set noincsearch
set nohlsearch

" virtual edit -> possible to put cursor after last character
" paired with esc not moving cursor one to the left we have a combination that just makes sense
" bit bugged with multicursor & not standard vim so reverted the esc trick
set ve=onemore
" inoremap <ESC> <ESC>`^

" Refactor to normal mode this is essential to not losing your hair
set idearefactormode=keep
map <S-R> <Action>(RenameElement)

" Scrolling ((C-u C-d M H L zb zt zm))
set scrolloff=8
noremap  <PageUp>   10k
inoremap <PageUp>   <c-o>10k
noremap  <c-u>      10k

noremap  <PageDown> 10j
inoremap <PageDown> <c-o>10j
noremap  <c-d>      10j

" zooming
map zi <Action>(EditorIncreaseFontSize)
map zo <Action>(EditorDecreaseFontSize)
map z0 <Action>(EditorResetFontSize)

" More natural copy paste (only yYdD copy | pP paste)
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

" Alternate moving (methods with [] camelcase with ())
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

" save and quit
noremap Q ZZ

" zoomin zoomout
map zi <Action>(EditorIncreaseFontSize)
map zo <Action>(EditorDecreaseFontSize)
map zr <Action>(EditorResetFontSize)

""" -----------------------------------------
""" ----------- Leader mappings -------------
""" -----------------------------------------

" IdeaVim
noremap <leader>v <nop>
noremap <leader>vv :source ~/.ideavimrc<cr>
noremap <leader>ve :e ~/IdeaProjects/avim/.vimrc<CR>
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
map gf  <Action>(Git.Fetch)
map gb  <Action>(Git.Branches)
map gm  <Action>(Git.Commit.And.Push.Executor)<Action>(CheckinProject)
map gcb <Action>(Git.CompareWithBranch)
map gpl <Action>(Vcs.UpdateProject)
map gps <Action>(Vcs.Push)
map gnb <Action>(Git.CreateNewBranch)
map <silent> gpb :!git checkout -<cr>

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
map <leader>h <Action>(LocalHistory.ShowHistory)

" Reformatting
map <leader>l <Action>(ReformatCode)
map <leader>L <Action>(ShowReformatFileDialog)

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

" Reverto patronum
noremap <leader>u <nop>
map <leader>ul <Action>(Vcs.RollbackChangedLines)
map <leader>ue <Action>(ChangesView.Revert)

""" -----------------------------------------
""" ---------- Control mappings -------------
""" -----------------------------------------

" use vim for all control commands (for windows users I recommend remapping intellij shortcuts to alt)
sethandler a:vim

" back/forward
map <c-i> <Action>(Forward)
map <c-o> <Action>(Back)

noremap <silent> <c-s> :w<cr>

" window split mappings - comes standard with ideavim
" CTRL+w s       -   Split current window horizontally
" CTRL+w v       -   Split current window vertically
" CTRL+w c       -   Close current window
" CTRL+w m       -   Move to window according to motion m
" CTRL+w o       -   Maximize current window (note: this overwrites your current window configuration)
