#!/bin/bash

#Git alias
    git config --global alias.l "log --stat";
    git config --global alias.s "status";
    git config --global alias.lo "log --oneline --decorate --all --graph";
    git config --global alias.c "commit -am";
    git config --global alias.p "push -u origin";
    git config --global alias.url "https://github.com/JIN26/";
    git config --global alias.github "git@github.com:JIN26/git.sh.git";
    git config --global user.email "Angelmantilla26@gmail.com";
    git config --global user.name "JIN26";
    git config --global core.editor nvim;
    #git config -l;
#OS aliases
    alias url='https://github.com/JIN26'
    alias github='git@github.com:JIN26'
    alias vim='vim -p'
    alias rm='rm -i'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias tree='tree -C'
    alias treed='tree -dQ'
    alias treel='tree -ph'
    alias cat='cat -ns'
    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
    # colored GCC warnings and errors
    #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    case '$OSTYPE' in
        cygwin*)
            alias open="cmd /c start"
            ;;
        linux-androideabi)
            alias start="xdg-open"
            alias open="xdg-open"
            ;;
        linux-gnu)
            alias start="xdg-open"
            alias open="xdg-open"
            ;;
        darwin*)
            alias start="open"
            ;;
    esac
#var
    PWDK="$HOME/.Jin/kali/Kali-fs/root/Desktop"
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\@\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# Add an "alert" alias for long running commands.  Use like so:
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
