# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Added by gato starting nov 14 1:24pm
#
export PATH="$HOME/.local/bin:$PATH"

#PS1="\[\e[32m\]\u@\h\[\e[35m\]:\w\[\e[0m\] "
PS1="\[\e[38;5;214m\]\u\[\e[32m\]:\w\[\e[0m\] "
#PS1="\e[38;5;214m\u@\h:\w \e[0m"

## aliases
alias supersu='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias ,l='ls -la -h'
alias ,ll='clear'
alias c=cd
alias DS='source data_sci_venv/bin/activate'
alias ,sc='source .bashrc'

## aliases for month and tree view of the files
alias tree='tree --dirsfirst -F'

alias jan='cal -m 01 || cal January'
alias feb='cal -m 02 || cal Feburary'
alias mar='cal -m 03 || cal March'
alias apr='cal -m 04 || cal April'
alias may='cal -m 05 || cal May'
alias jun='cal -m 06 || cal June'
alias jul='cal -m 07 || cal July'
alias aug='cal -m 08 || cal August'
alias sep='cal -m 09 || cal September'
alias oct='cal -m 10 || cal October'
alias nov='cal -m 11 || cal November'
alias dec='cal -m 12 || cal December'

## completion
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

clear

# Display system information in the terminal.
MY_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
FECHA=$(date +%d/%m/%Y)
printf "\n"
echo '-------------------------------------------------------------------------------'
printf "\n"
#printf '\033[00;32m'"%s   IP\t\t:\033[00m\033[01;32m$(curl ifconfig.me 2> /dev/null)\033[00m\n" 
#printf '\033[00;32m'"%s   FECHA\t:\033[00m\33[01;32m${FECHA}\033[00m\n"
printf '\033[00;32m'"%s   USERNAME\t:\033[00m\033[01;32m$(echo $USER)\033[00m\n"
printf '\033[00;32m'"%s   HOSTNAME\t:\033[00m\033[01;32m$(hostname -f)\033[00m\n" 
printf '\033[00;32m'"%s   FECHA\t:\033[00m\033[01;32m$(date -R)\033[00m\n"
printf '\033[00;32m'"%s   SYSTEMA\t:\033[00m\033[01;32m$(awk -F= '/^PRETTY_NAME/{gsub("\"",""); print $2}' /etc/os-release)\033[00m\n"
printf '\033[00;32m'"%s   CPU\t\t:\033[00m\033[01;32m$(echo $(awk -F: '/model name/{print $2}' /proc/cpuinfo | head -1))\033[00m\n"
printf '\033[00;32m'"%s   KERNEL\t:\033[01;32m$(uname -rms)\033[00m\n"
printf '\033[00;32m'"%s   UPTIME\t:\033[01;32m$(uptime -p)\033[00m\n"
printf '\033[00;32m'"%s   PACKAGES\t:\033[01;32m$(dpkg --get-selections | wc -l)\033[00m\n" 
printf '\033[00;32m'"%s   RESOLUTION\t:\033[01;32m$(xrandr | awk '/\*/{printf $1" "}')\033[00m\n"
printf '\033[00;32m'"%s   MEMORY\t:\033[01;32m$(free -m -h | awk '/Mem/{print $3"/"$2}')\033[00m\n" 
printf '\033[00;32m'"%s   IP ADDRESS\t:\033[01;32m${MY_IP}\033[00m\n";
printf '\033[00;32m'"%s   GATEWAY\t:\033[01;32m$(ip r | awk '/default/{print $3}')\033[00m\n" 
#printf '\033[00;32m'"%s   DNS SERVERS\t:\033[01;32m$(systemd-resolve --status | awk -F: '/DNS Servers/{printf $2}')\033[00m\n"
printf "\n"
echo '-------------------------------------------------------------------------------'
