"=============================================================================
"    File Name:     _vimrc.
"    Maintainer:    sacranto  [nuclear2power@gmail.com]
"    Homepage:      http://ffs.nuclear2power.com

"    Created:       2011-04-10 00:08:26
"    Last Modified: 2011-04-12 14:03:05
"    Descprtion:    personal vim config file of sacranto
"=============================================================================

set nocp

" Tab related
set ts=4
set sw=4
set smarttab
set et
set ambiwidth=double

" Format related
" set tw=78
set nolbr
set fo+=mB

" Indent related
set cin
set ai
set cino=:0g0t0(susj1

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=inclusive

if has("gui_running")
    set imactivatekey=C-space
    inoremap <ESC> <ESC>:set iminsert=0<CR>
endif


" Search related
set ic

" Misc
set wildmenu
set nospell

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
filetype plugin indent on

" Display related
set ru
set sm
set hls
if (has("gui_running"))
    set guioptions+=b
    colo torte
    set wrap
else
    colo ron
    set nowrap
endif
syntax on

"=============================================================================
" Modes
"=============================================================================

function EnglishMode()
    "set imactivatekey=
    "set noimcmdline
    "set iminsert=0
    "set imsearch=0
    setlocal spell
endfunction
command -nargs=0 EnglishMode call EnglishMode()

function ChineseMode()
    "set imactivatekey=C-space
    "set noimcmdline
    "set iminsert=2
    "set imsearch=2
    setlocal nospell
endfunction
command -nargs=0 ChineseMode call ChineseMode()

function TextMode()
    setlocal nocin
    setlocal nosm
    setlocal noai
    "setlocal tw=78
endfunction
command -nargs=0 TextMode call TextMode()

function CodeMode()
    setlocal cin
    setlocal sm
    setlocal ai
    setlocal tw=78
endfunction
command -nargs=0 CodeMode call CodeMode()

function MailMode()
    call TextMode()
    setlocal ft=mail
    "setlocal tw=70
endfunction
command -nargs=0 MailMode call MailMode()

function BBSMode()
    call MailMode()
    call ChineseMode()
    setlocal ft=bbs
    setlocal fenc=cp936
    "setlocal tw=78
endfunction
command -nargs=0 BBSMode call BBSMode()

function VikiMode()
    call ChineseMode()
    setlocal ft=viki
    let maplocalleader='_' 
endfunction
command -nargs=0 VikiMode call VikiMode()


"=============================================================================
" Functions
"=============================================================================



"=============================================================================
" Platform dependent settings
"=============================================================================

if (has("win32"))

    "-------------------------------------------------------------------------
    " Win32
    "-------------------------------------------------------------------------

    if (has("gui_running"))
        set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
        set guifontwide=NSimSun:h10.5:cGB2312
    endif

    " For Viki
    let g:netrw_browsex_viewer="start"
    

else

    "-------------------------------------------------------------------------
    " Linux
    "-------------------------------------------------------------------------
    
    if (has("gui_running"))
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    endif

endif


"==================================================================
" Plugin settings
" =================================================================

" taglist
" set the positon of ctags
set tags="C:\\Program Files\\ctags58\\tags"
" tag窗口在右边显示
let Tlist_Use_Right_Window=1

" jquery syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Viki
let g:vikiNameSuffix=".viki"
autocmd! BufRead,BufNewFile *.viki call VikiMode()

" TimeStamp
let g:timestamp_regexp = '\v\C%(<Last %([cC]hanged?|[mM]odified)\s*:\s+)@<=(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}|TIMESTAMP)|%(<[cC]reated\s*:\s+)@<=TIMESTAMP'
let g:timestamp_rep="%Y-%m-%d %H:%M:%S"
let g:timestamp_modelines=10


" FileHeadInfo
let g:vimrc_author='sacranto'
let g:vimrc_email='nuclear2power@gmail.com'
let g:vimrc_homepage='http://ffs.nuclear2power.com' 

