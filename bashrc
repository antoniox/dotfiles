# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -d ~/.bash_completion.d ] && [ -f ~/.bash_completion.d/python-argcomplete.sh ]; then
    . ~/.bash_completion.d/python-argcomplete.sh
fi

export LC_ALL=en_US.utf-8
export DEBFULLNAME="Anton Martsenyuk"
export DEBEMAIL="ngc224@yandex-team.ru"
export EDITOR=vim
export PATH=$PATH:~/repos/mrjob/tools/evvers:~/tools:~/repos/arcadia/devtools/ya

export YT_PREFIX=//statbox/
export MRPROC_SCALE=daily
export QC_WHEEL_PATH=$HOME/repos/backend/wheelhouse
export NILE_WHEEL_PATH=$HOME/repos/nile/wheelhouse:$HOME/repos/cyson/wheelhouse:$HOME/repos/qb2/wheelhouse

alias kjob="./job -cluster=kant"
alias sjob="./job -cluster=smith"
alias qjob="./job -cluster=quine"
alias pjob="./job -cluster=plato"
alias rjob="./job -cluster=redwood"

alias ssh-parser="ssh statbox@mrparser1e.stat.yandex.net"
alias ssh-betaparser="ssh statbox@mrparser2ft.stat.yandex.net"
alias ssh-webface="ssh statbox@webface04e.stat.yandex.net"
alias ssh-betaface="ssh statbox@webface01ft.stat.yandex.net"

alias mr="~/repos/mrjob/tools/evvers/mr"

. ~/.bash_functions

workon devel

if [ -z "$TMUX" ]; then
    # we're not in a tmux session

    if [ ! -z "$SSH_TTY" ]; then
        # We logged in via SSH

        SOCK=$HOME/.ssh/.auth_sock
        if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
        then
            rm -f $SOCK
            ln -sf $SSH_AUTH_SOCK $SOCK
            export SSH_AUTH_SOCK=$SOCK
        fi
        # Add all default keys to ssh auth
        ssh-add 2>/dev/null

        # start tmux
        tmux attach
    fi
fi

source /home/ngc224/.ya.completion/bash/ya # YA_COMPLETION NAME='ya'
