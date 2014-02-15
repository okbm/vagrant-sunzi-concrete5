export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG=ja_JP.UTF-8

alias la="ls -A"
alias ll='ls -lG'
alias ls='ls -G'

export PS1="\u@\W\\$ "
alias tail_err='tail -f /var/log/apache2/error.log'
alias tail_acc='tail -f /var/log/apache2/access.log'

cdls ()
{
    \cd "$@" && ls
}
alias cd="cdls"
