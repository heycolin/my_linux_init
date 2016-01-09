# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="avit"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found compleat debian dircycle encode64 lol screen fabric git-flow zsh-syntax-highlighting z)

# # Enable autosuggestions automatically.
# zle-line-init() {
    # zle autosuggest-start
# }
# zle -N zle-line-init

# bindkey '^T' autosuggest-toggle
# # autosuggest-toggle – disable/enable autosuggestions.
# # autosuggest-execute-suggestion – accept the suggestion and execute it.

source $ZSH/oh-my-zsh.sh

export LD_LIBRARY_PATH=.
export LD_LIBRARY_PATH=.:$HOME/cocos2dx/lib/linux/debug/

export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

# Customize to your needs...
# JAVA
export JAVA_HOME=/home/colin/android/jdk1.8.0_66
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH

# ANDROIDSDK
export ANDROID_HOME=$HOME/sdks/android-sdk-linux
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_CMD=/usr/lib/jvm/java-7-openjdk-amd64/bin/java

# NDK
export NDK_ROOT=$HOME/sdks/android-ndk-r9/
export ANDROIDNDK=$HOME/sdks/android-ndk-r9/
export ANDROIDNDKVER=r9

# android package
export PATH=$HOME/sprite/pkgtools:$PATH
export FRAMEWORK=$HOME/sprite/framework

export NDK_MODULE_PATH=${FRAMEWORK}/cocos2d-x-2.1.5:${FRAMEWORK}/cocos2d-x-2.1.5/cocos2dx/platform/third_party/android/prebuilt:${FRAMEWORK}

export SERVERS='13 84 133 134 135 136 137 85 86 90 91'

xset r rate 150 80

alias gvim="gvim 2>/dev/null"

#########################################
#标题栏、任务栏样式{{{
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
   precmd () { print -Pn "\e]0;%n@%M//%/\a" }
   preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
   ;;
esac
#}}}

#关于历史纪录的配置 {{{
#历史纪录条目数量
export HISTSIZE=10000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.zsh_history
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
#为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY

#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS

#在命令前添加空格，不将此命令添加到纪录文件中
#setopt HIST_IGNORE_SPACE
#}}}

#杂项 {{{
#允许在交互模式中使用注释 例如：
#cmd #这是注释
setopt INTERACTIVE_COMMENTS

#扩展路径
#/v/c/p/p => /var/cache/pacman/pkg
setopt complete_in_word

#禁用 core dumps
limit coredumpsize 0

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
#}}}

#自动补全功能 {{{
setopt AUTO_LIST
setopt AUTO_MENU
#开启此选项，补全时会直接选中菜单项
#setopt MENU_COMPLETE

autoload -U compinit
compinit

#自动补全缓存
#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#自动补全选项
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect: lines: %L matches: %M [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

#彩色补全菜单
#eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#kill 命令补全
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

#补全类型提示分组
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

# cd ~ 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#}}}

##空行(光标在行首)补全 "cd " {{{
user-complete(){
    case $BUFFER in
        "" ) # 空行填入 "cd "
            BUFFER="cd "
            zle end-of-line
            zle expand-or-complete
            ;;
        "cd --" ) # "cd --" 替换为 "cd +"
            BUFFER="cd +"
            zle end-of-line
            zle expand-or-complete
            ;;
        "cd +-" ) # "cd +-" 替换为 "cd -"
            BUFFER="cd -"
            zle end-of-line
            zle expand-or-complete
            ;;
        * )
            zle expand-or-complete
            ;;
    esac
}
zle -N user-complete
bindkey "\t" user-complete
#}}}

##在命令前插入 sudo {{{
#定义功能
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line #光标移动到行末
}
zle -N sudo-command-line
#定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}

#历史命令 top10
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
#}}}

####{{{
function timeconv { date -d @$1 +"%Y-%m-%d %T" }

# }}}


#########################################
# AVIT ZSH Theme

PROMPT='>> $(_user_host)${_current_dir}$(git_prompt_info) $(_ruby_version)
>> '
PROMPT2='%{$fg[grey]%}◀%{$reset_color%} '
RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(git_prompt_status)${_return_status}%{$(echotc DO 1)%}'

local _current_dir="%{$fg[blue]%}%3~%{$reset_color%} "
local _return_status="%{$fg[red]%}%(?..⍉)%{$reset_color%}"
local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

function _user_host() {
    if [[ -n $SSH_CONNECTION ]]; then
      me="%n@%m"
    elif [[ $LOGNAME != $USER ]]; then
      me="%n"
    fi
    if [[ -n $me ]]; then
      echo "%{$fg[cyan]%}$me%{$reset_color%}:"
    fi
}

function _vi_status() {
    if {echo $fpath | grep -q "plugins/vi-mode"}; then
        echo "$(vi_mode_prompt_info)"
    fi
}

function _ruby_version() {
    if {echo $fpath | grep -q "plugins/rvm"}; then
        echo "%{$fg[grey]%}$(rvm_prompt_info)%{$reset_color%}"
    fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
      # Only proceed if there is actually a commit.
      if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
        # Get the last commit.
        last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
        now=$(date +%s)
        seconds_since_last_commit=$((now-last_commit))
 
        # Totals
        minutes=$((seconds_since_last_commit / 60))
        hours=$((seconds_since_last_commit/3600))
 
        # Sub-hours and sub-minutes
        days=$((seconds_since_last_commit / 86400))
        sub_hours=$((hours % 24))
        sub_minutes=$((minutes % 60))
 
        if [ $hours -gt 24 ]; then
            commit_age="${days}d"
        elif [ $minutes -gt 60 ]; then
            commit_age="${sub_hours}h${sub_minutes}m"
        else
            commit_age="${minutes}m"
        fi
 
        color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
        echo "$color$commit_age%{$reset_color%}"
      fi
    fi
}

if [[ $USER == "root" ]]; then
    CARETCOLOR="red"
else
    CARETCOLOR="white"
fi

MODE_INDICATOR="%{$fg[yellow]%}❮❮❮%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}]%{$fg[red]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}]%{$fg[red]%}*%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[grey]%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export GREP_COLOR='1;33'
