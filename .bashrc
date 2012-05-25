# .bashrc

# User specific aliases and functions
# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef

# よく使うエイリアスやら各コマンドのデフォルトのオプションを設定
alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias vi='vim'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias ps='ps --sort=start_time'

# man とかを見るときはいつも less を使う。
export PAGER=less
# less のステータス行にファイル名と行数、いま何%かを表示するようにする。
export LESS='-X -i -P ?f%f:(stdin).  ?lb%lb?L/%L..  [?eEOF:?pb%pb\%..]'
# これを設定しないと日本語がでない less もあるので一応入れておく。
export JLESSCHARSET=japanese-ujis

# EOF (Ctrl-D) 入力は 10回まで許可。
IGNOREEOF=10
# 履歴のサイズ。新山の場合はこれで半年ぐらい前のやつまで残る。
HISTSIZE=50000
HISTFILESIZE=50000

# なにも入力してないときはコマンド名を補完しない。
# (メチャクチャ候補が多いので。)
shopt -s no_empty_cmd_completion

# プロンプトの表示をカスタマイズ
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

export PS1="\[$BCyan\]┌─[\[$Color_Off\]\[$Green\]\u\[$BCyan\]][\[$Color_Off\]\[$Yellow\]\h\[$BCyan\]][\[$Color_Off\]\[$Cyan\]\w\[$BCyan\]]\n└>>\[$Color_Off\] \[$BGreen\]$\[$Color_Off\] "

# つねに直前のコマンドの終了状態をチェックさせる。
# もし異常終了した場合は、その状態(数値)を表示する。
function showexit {
    local s=$?
    dispstatus "${PWD/\/home\/yusuke/~}"
    if [[ $s -eq 0 ]]; then return; fi
    echo "exit $s"
}
PROMPT_COMMAND=showexit

# 補完の設定。あまり詳しくは設定してない。
complete -d cd
complete -c man
complete -c h
complete -c wi
complete -v unset

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
