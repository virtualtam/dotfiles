function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red

    # Unicode eye candy
    switch "$TERM"
    case alacritty screen "rxvt-unicode*" "tmux-*" "xterm*"
        # fancy unicode
        set top_brace '╭ '
        set bot_brace '╰ '
        set suffix '≻'
    case '*'
        # simple terms (for simple ricks)
        set top_brace ''
        set bot_brace ''
        set suffix '>'
    end

    # Color the prompt differently when we're root
    set -l color_cwd --bold blue
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n -s $top_brace (prompt_login)'( ' (set_color $color_cwd) (prompt_pwd --dir-length 0) $normal ' )' (fish_vcs_prompt) $normal " "$prompt_status \n $bot_brace (set_color --bold white ) (date "+%Y-%m-%d %H:%M:%S") ' ' $normal $suffix " "
end
