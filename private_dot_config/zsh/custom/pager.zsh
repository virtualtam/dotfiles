#!/bin/zsh
# Less pager
#
# +Gg
#    Go to the end, then to the beginning, so the prompt can display file
#    progress.
#
# -F or --quit-if-one-screen
#    Causes less to automatically exit if the entire file can be displayed on
#    the first screen.
#
# -m or --long-prompt
#    Causes less to prompt verbosely (like more), with the percent into the
#    file. By default, less prompts with a colon.
#
# -M or --LONG-PROMPT
#    Causes less to prompt even more verbosely than more.
#
# -s or --squeeze-blank-lines
#    Causes consecutive blank lines to be squeezed into a single blank line.
#    This is useful when viewing nroff output.

export MANPAGER='less -s -M +Gg'
export PAGER='less -F -s'
