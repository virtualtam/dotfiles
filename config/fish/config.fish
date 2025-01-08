if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Source OS-specific configuration
set current_directory (dirname (status --current-filename))
switch (uname)
    case Darwin
        source $current_directory/config_darwin.fish
end

# Source host-specific configuration
set fish_local_dir ~/.config/fish_local

if test -d $fish_local_dir
    set fish_local_variables $fish_local_dir/fish_variables
    set fish_local_conf_dir $fish_local_dir/conf.d
    set fish_local_functions_dir $fish_local_dir/functions

    if test -f $fish_local_variables
        # Expected syntax for host-specific variables:
        #
        # set MY_VARIABLE "host-specific-value"
        # set -gx PATH $PATH /host/specific/path
        source $fish_local_variables
    end

    if test -d $fish_local_conf_dir
        for func in $fish_local_conf_dir/*.fish
            source $func
        end
    end

    if test -d $fish_local_functions_dir
        for func in $fish_local_functions_dir/*.fish
            source $func
        end
    end
end
