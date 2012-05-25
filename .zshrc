## 環境変数設定 ==========================================================
export PATH=/usr/local/bin:$PATH

# 実行時間
REPORTTIME=3

autoload -U colors zsh/terminfo
colors
setopt prompt_subst

# 色のエイリアス作成
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"
# 括弧
eval PR_BRSL='%{$PR_BOLD$PR_CYAN%}[${PR_NO_COLOR}'
eval PR_BRSR='%{$PR_BOLD$PR_CYAN%}]${PR_NO_COLOR}'


# ルート/ユーザの切り替え部分
if [[ $UID -eq 0 ]]; then
    eval PR_USER='${PR_BOLD}${PR_RED}%n${PR_NO_COLOR}'
    eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
else
    eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
    eval PR_USER_OP='${PR_GREEN}\$${PR_NO_COLOR}'
fi
# ホスト名
eval PR_HOST='${PR_YELLOW}%m${PR_NO_COLOR}'


# プロンプトの設定
local p_user="${PR_BRSL}${PR_USER}${PR_BRSR}"
local p_host="${PR_BRSL}${PR_HOST}${PR_BRSR}"
local p_path="${PR_BRSL}${PR_CYAN}%/${PR_BRSR}"
local p_opel='${PR_BOLD}${PR_CYAN}>> ${PR_USER_OP}'
local p_retn="%(?..%{$PR_BOLD$PR_RED%}>%?<%{$PR_NO_COLOR%})"
local pl_border='${PR_BOLD}${PR_CYAN}┌─${PR_NO_COLOR}'
local pr_border='${PR_BOLD}${PR_CYAN}└─${PR_NO_COLOR}'

PROMPT="${pl_border}${p_user}${p_host}${p_path}"$'\n'"${pr_border}${p_opel} "
RPROMPT="${p_retn} %1(v|%F{green}%1v%f|)"

###  local rvm_ruby=''
###  if which rvm-prompt &> /dev/null; then
###    rvm_ruby='%{$PR_RED%}?$(rvm-prompt i v g s)?%{$PR_NO_COLOR%}'
###  else
###    if which rbenv &> /dev/null; then
###      rvm_ruby='%{$PR_RED%}?$(rbenv version | sed -e "s/ (set.*$//")?%{$PR_NO_COLOR%}'
###    fi
###  fi

##補完設定 ===============================================================
autoload -U compinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=2 
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
setopt complete_in_word
setopt glob_complete
setopt hist_expand
setopt numeric_glob_sort

# オートディレクトリ保持
setopt auto_pushd

# コマンドミスの修正案
setopt correct

# 補完を詰める
setopt list_packed

# beep音OFF
setopt nolistbeep

##ログ設定 ===============================================================
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
#setopt extended_history
#function history-all { history -E 1 }
#setopt COMPLETE_IN_WORD


##エイリアス設定 =========================================================
setopt complete_aliases
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    alias ll='ls -G -w -al'
    alias la='ls -G -w -a'
    ;;
linux*)
    alias ls="ls --color=auto -v"
    alias ll='ls --color=auto -alh'
    alias la='ls --color=auto -a'
    ;;
esac


alias resource='source ~/.zshrc'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear'
alias lf="ls -F"
alias du="du -h"
alias df="df -h"
alias vi="vim"
alias sg="find ./ -type f -print | xargs grep"
alias sudo="sudo PATH=$PATH"

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

