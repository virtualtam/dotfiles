function fish_virtualenv_prompt --description "Python virtual environment"
    if test -z "$VIRTUAL_ENV"
        return
    end

    set python_venv (basename $VIRTUAL_ENV)
    set python_version (python -c 'import platform; print(platform.python_version_tuple()[0])')

    echo -n -s ' [' (set_color blue) 'py' $python_version (set_color yellow) ':' $python_venv (set_color normal) ']'
end
