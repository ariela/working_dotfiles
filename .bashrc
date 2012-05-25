# .bashrc

# User specific aliases and functions
# ctrl+s �ǽ��Ϥ���å�����Ƥ��ޤ��Τ��ɤ�
stty stop undef

# �褯�Ȥ������ꥢ�����ƥ��ޥ�ɤΥǥե���ȤΥ��ץ���������
alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias vi='vim'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias ps='ps --sort=start_time'

# man �Ȥ��򸫤�Ȥ��Ϥ��Ĥ� less ��Ȥ���
export PAGER=less
# less �Υ��ơ������Ԥ˥ե�����̾�ȹԿ������޲�%����ɽ������褦�ˤ��롣
export LESS='-X -i -P ?f%f:(stdin).  ?lb%lb?L/%L..  [?eEOF:?pb%pb\%..]'
# ��������ꤷ�ʤ������ܸ줬�Ǥʤ� less �⤢��Τǰ������Ƥ�����
export JLESSCHARSET=japanese-ujis

# EOF (Ctrl-D) ���Ϥ� 10��ޤǵ��ġ�
IGNOREEOF=10
# ����Υ������������ξ��Ϥ����Ⱦǯ���餤���Τ�ĤޤǻĤ롣
HISTSIZE=50000
HISTFILESIZE=50000

# �ʤˤ����Ϥ��Ƥʤ��Ȥ��ϥ��ޥ��̾���䴰���ʤ���
# (����㥯������䤬¿���Τǡ�)
shopt -s no_empty_cmd_completion

# �ץ��ץȤ�ɽ���򥫥����ޥ���
Color_Off='\e[0m'
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

export PS1="\[$BCyan\]����[\[$Color_Off\]\[$Green\]\u\[$BCyan\]][\[$Color_Off\]\[$Yellow\]\h\[$BCyan\]][\[$Color_Off\]\[$Cyan\]\w\[$BCyan\]]\n��>>\[$Color_Off\] \[$BGreen\]$\[$Color_Off\] "

# �Ĥͤ�ľ���Υ��ޥ�ɤν�λ���֤�����å������롣
# �⤷�۾ｪλ�������ϡ����ξ���(����)��ɽ�����롣
function showexit {
    local s=$?
    dispstatus "${PWD/\/home\/yusuke/~}"
    if [[ $s -eq 0 ]]; then return; fi
    echo "exit $s"
}
PROMPT_COMMAND=showexit

# �䴰�����ꡣ���ޤ�ܤ��������ꤷ�Ƥʤ���
complete -d cd
complete -c man
complete -c h
complete -c wi
complete -v unset

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
