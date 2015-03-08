# ~/.bash_aliases
# author	VirtualTam	<virtualtam@flibidi.org>

# Audio
alias mocp='padsp mocp'

# Compilation
alias gflag='gcc -W -Wall -Wextra -ansi -pedantic'
alias gdebug='gcc -W -Wall -Wextra -ansi -pedantic -g -pg -DNDEBUG'
alias mclean='make clean'
alias mdist='make distclean'

# Dev
alias v2a='source ~/virtualenv/python27/bin/activate'
alias v3a='source ~/virtualenv/python34/bin/activate'

# Editors
alias emax='emacs -nw'

# Games
alias steam='steam && xsetroot -cursor_name left_ptr'
#alias doom3='doom3 +set s_alsa_pcm plughw:5 +set s_driver alsa'

# *nix
alias ll='ls -lh'
alias la='ls -lAh'

alias md='mkdir'
alias cd..='cd ..'
#alias n.='nautilus .'

# SSH
alias vibi='ssh virtualtam@flibidi.org'
alias mibi='ssh minecraft@flibidi.org'

# iii];p
alias rm='rm --preserve-root'

# MATÉ session
#if [ `ps -eo comm | grep session` = "mate-session" ]; then
#    alias n.='echo "Call me caja maybe!";caja .';
#    alias c.='caja .';
#    alias evince='echo "Call me atril maybe!";atril';
#    alias gedit='echo "Call me pluma maybe!";pluma';
#fi
