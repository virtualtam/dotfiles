switch (uname)
    case Linux
        if set -q XDG_RUNTIME_DIR
            set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
        else
            set -gx SSH_AUTH_SOCK "$HOME/.ssh/ssh-agent.socket"
        end
    case Darwin
        set -gx SSH_AUTH_SOCK (getconf DARWIN_USER_TEMP_DIR)ssh-agent.socket
end
