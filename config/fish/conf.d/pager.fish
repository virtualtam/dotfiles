# less colors
set -gx LESS_TERMCAP_mb (printf '\e[1;31m')    # begin blinking
set -gx LESS_TERMCAP_md (printf '\e[1;31m')    # begin bold
set -gx LESS_TERMCAP_me (printf '\e[0m')       # end mode
set -gx LESS_TERMCAP_se (printf '\e[0m')       # end standout-mode
set -gx LESS_TERMCAP_so (printf '\e[0;40;33m') # begin standout-mode - info box
set -gx LESS_TERMCAP_ue (printf '\e[0m')       # end underline
set -gx LESS_TERMCAP_us (printf '\e[1;32m')    # begin underline

# pager
set -gx MANPAGER "less -s -M +Gg"
set -gx PAGER "less -F -s"
