"---------------------------------------------------------------------------------------------------
" ��������
"---------------------------------------------------------------------------------------------------
set nocompatible                 " vi�ߴ��ʤ�
let mapleader = ","              " �����ޥåץ꡼����
set scrolloff=5                  " �����������;�����
set textwidth=0                  " ��Ԥ�Ĺ��ʸ�Ϥ�񤤤Ƥ��Ƥ⼫ư�ޤ��֤��򤷤ʤ�
set nobackup                     " �Хå����å׼��ʤ�
set autoread                     " ¾�ǽ񤭴�����줿�鼫ư���ɤ�ľ��
set noswapfile                   " ����åץե�������ʤ�
set hidden                       " �Խ���Ǥ�¾�Υե�����򳫤���褦�ˤ���
set backspace=indent,eol,start   " �Хå����ڡ����Ǥʤ�Ǥ�ä���褦��
set formatoptions=lmoq           " �ƥ������������ץ���󡤥ޥ���Х��ȷϤ��ɲ�
set vb t_vb=                     " �ӡ��פ�ʤ餵�ʤ�
set browsedir=buffer             " Explore�ν���ǥ��쥯�ȥ�
set whichwrap=b,s,h,l,<,>,[,]    " ����������Ƭ�������ǻߤޤ�ʤ��褦�ˤ���
set showcmd                      " ���ޥ�ɤ򥹥ơ������Ԥ�ɽ��
set showmode                     " ���ߤΥ⡼�ɤ�ɽ��
set viminfo='50,<1000,s100,\"50  " viminfo�ե����������
set modelines=0                  " �⡼�ɥ饤���̵��

" OS�Υ���åץܡ��ɤ���Ѥ���
set clipboard+=unnamed

"��󥯤���ʸ���ϡ������ƥ�Υ���åץܡ��ɤ������"
set clipboard=unnamed
" �����⡼�ɤ�Ctrl+k�򲡤��ȥ���åץܡ��ɤ����Ƥ�Ž���դ�����褦�ˤ��� "
imap <C-V>  <ESC>"*pa

let g:molokai_original = 1
set t_Co=256
colorscheme molokai

"---------------------------------------------------------------------------------------------------
" ɽ������
"---------------------------------------------------------------------------------------------------
set showmatch       "������ϻ����б������̤�ɽ��
set number          "���ֹ��ɽ������
set list            "�ԲĻ�ʸ��ɽ��
"�ԲĻ�ʸ��ɽ����ˡ
set listchars=eol:\ ,tab:>.,trail:_,extends:>,precedes:< " �ԲĻ�ʸ����ɽ������
set display=uhex    "�����Բ�ǽʸ����16�ʿ���ɽ��

" ���ѥ��ڡ�����ɽ��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /��/

"���֤κ�¦�˥�������ɽ��
highlight SpecialKey cterm=underline ctermfg=gray guifg=gray

:set lazyredraw " ���ޥ�ɼ¹���Ϻ����褷�ʤ�
:set ttyfast    " ��®�����ߥʥ���³��Ԥ�

"---------------------------------------------------------------------------------------------------
" ���󥳡�������
"---------------------------------------------------------------------------------------------------
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconv��eucJP-ms���б����Ƥ��뤫������å�
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
    " iconv��JISX0213���б����Ƥ��뤫������å�
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodings����
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    " ������ʬ
    unlet s:enc_euc
    unlet s:enc_jis
endif
" ���ܸ��ޤޤʤ����� fileencoding �� encoding ��Ȥ��褦�ˤ���
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���ԥ����ɤμ�ưǧ��
set fileformats=unix,dos,mac
" ���Ȥ�����ʸ�������äƤ⥫��������֤�����ʤ��褦�ˤ���
if exists('&ambiwidth')
    set ambiwidth=double
endif

"---------------------------------------------------------------------------------------------------
" �����䴰����
"---------------------------------------------------------------------------------------------------
set wildmenu            " ���ޥ���䴰�򶯲�
set wildchar=<tab>      " ���ޥ���䴰�򳫻Ϥ��륭��
set wildmode=list:full  " �ꥹ��ɽ������Ĺ�ޥå�
set history=1000        " ���ޥ�ɡ������ѥ�����������
set complete+=k         " �䴰�˼���ե������ɲ�
"tab�ǥ�����䴰
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"---------------------------------------------------------------------------------------------------
" ����ǥ������
"---------------------------------------------------------------------------------------------------
set autoindent  "�����ȥ���ǥ�Ȥ���
set paste       "�ڡ����Ȼ���autoindent��̵����(on�ˤ����autocomplpop.vim��ư���ʤ�)
set smartindent " �������Ԥ򳫻Ϥ����Ȥ��ˡ��������ԤΥ���ǥ�Ȥ򸽺߹Ԥ�Ʊ���̤ˤ��롣
set cindent     "C�ץ����ե�����μ�ư����ǥ�Ȥ�Ϥ��

"�����������ꤹ��
set tabstop=4
set shiftwidth=4
set softtabstop=0

if has("autocmd")
  "�ե����륿���פθ�����ͭ���ˤ���
  filetype plugin on
  "���Υե����륿���פˤ��碌������ǥ�Ȥ����Ѥ���
  filetype indent on
  " ������ft�Ǥϥ���ǥ�Ȥ�̵����
  "autocmd FileType php filetype indent off

  autocmd FileType html :set indentexpr=
  autocmd FileType xhtml :set indentexpr=
endif

set expandtab   " Tab�����������Ѵ�


"---------------------------------------------------------------------------------------------------
" �����Х��������
"---------------------------------------------------------------------------------------------------
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> :<C-w>k
nnoremap <C-l> ;<C-w>l
nnoremap <C-h> ;<C-w>h

"---------------------------------------------------------------------------------------------------
" ��������
"---------------------------------------------------------------------------------------------------
set wrapscan   " �Ǹ�ޤǸ�����������Ƭ�����
set ignorecase " ��ʸ����ʸ��̵��
set smartcase  " ����ʸ�������ʸ�����ޤޤ�Ƥ�����϶��̤��Ƹ�������
set incsearch  " ���󥯥��󥿥륵����
set hlsearch   " ����ʸ����ϥ��饤��
"Esc��2�󲡤��ǥϥ��饤�Ⱦõ�
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"---------------------------------------------------------------------------------------------------
" ���ơ������饤������
"---------------------------------------------------------------------------------------------------
"���ơ������饤�����ɽ����2�ԡ�
set laststatus=2

"�������뤬�����ܤβ����ܤ��֤���Ƥ��뤫��ɽ������
set ruler

"���ơ������饤���ʸ�������ɤȲ���ʸ����ɽ������
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

"***************************************************************************************************
" �ؿ����
"***************************************************************************************************
function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" -- tab�ǥ�����䴰
function! InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col -1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
