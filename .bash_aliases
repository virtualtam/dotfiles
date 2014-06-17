# ~/.bash_aliases
# author	VirtualTam	<virtualtam@flibidi.org>

# iii];p
alias rm='rm --preserve-root'

# Editors
alias emax='emacs -nw'

# SSH
alias vibi='ssh virtualtam@flibidi.org'
alias mibi='ssh minecraft@flibidi.org'

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lAh'

# Compilation
alias gflag='gcc -W -Wall -Wextra -ansi -pedantic'
alias gdebug='gcc -W -Wall -Wextra -ansi -pedantic -g -pg -DNDEBUG'
alias mclean='make clean'
alias mdist='make distclean'

# Games
alias steam='steam && xsetroot -cursor_name left_ptr'
#alias doom3='doom3 +set s_alsa_pcm plughw:5 +set s_driver alsa'

# Spell shortcuts :p
alias md='mkdir'
alias cd..='cd ..'
#alias n.='nautilus .'

# MATÉ session
#if [ `ps -eo comm | grep session` = "mate-session" ]; then
#    alias n.='echo "Call me caja maybe!";caja .';
#    alias c.='caja .';
#    alias evince='echo "Call me atril maybe!";atril';
#    alias gedit='echo "Call me pluma maybe!";pluma';
#fi
