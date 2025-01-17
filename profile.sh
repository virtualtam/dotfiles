# ~/.profile

if [ -n "${BASH_VERSION}" ]; then
    [ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
elif [ -n "${ZSH_VERSION}" ]; then
    [ -f "${HOME}/.zshrc" ] && . "${HOME}/.zshrc"
fi

# SSH Agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Text Editor
export EDITOR="nvim"
export VISUAL="${EDITOR}"

# User binaries
[ -d "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"

# Qt theme management
if command -v qt6ct > /dev/null 2>&1; then
    export QT_QPA_PLATFORMTHEME="qt6ct"
elif command -v qt5ct > /dev/null 2>&1; then
    export QT_QPA_PLATFORMTHEME="qt5ct"
fi

# Erlang / Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Go
export GOPATH="${HOME}/.golang"
export GOBIN="${GOPATH}/bin"
[ -d "${GOBIN}" ] && PATH="${GOBIN}:${PATH}"

# Google Cloud SDK
# https://cloud.google.com/iap/docs/using-tcp-forwarding#increasing_the_tcp_upload_bandwidth
export CLOUDSDK_PYTHON_SITEPACKAGES=1

if [ -n "${ZSH_VERSION}" ]; then
    [ -f /opt/google-cloud-cli/completion.zsh.inc ] && source /opt/google-cloud-cli/completion.zsh.inc
    [ -f /opt/google-cloud-cli/path.zsh.inc ] && source /opt/google-cloud-cli/path.zsh.inc
fi

# Java / GraalVM
GRAALVM_HOME=/usr/lib/jvm/java-11-graalvm
[ -d ${GRAALVM_HOME} ] && export GRAALVM_HOME

# NodeJS
[ -d "${HOME}/.node_modules/bin" ] && PATH="${HOME}/.node_modules/bin:${PATH}"
[ -d "${HOME}/.yarn/bin" ] && PATH="${HOME}/.yarn/bin:${PATH}"

if [ -f /usr/share/nvm/init-nvm.sh ]
then
    # nvm is installed system-wide
    . /usr/share/nvm/init-nvm.sh
else
    # nvm is installed for the current user
    export NVM_DIR="${HOME}/.nvm"
    [ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"

    if [ -n "${BASH_VERSION}" ]; then
        [ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"
    fi
fi

# Rust
[ -d "${HOME}/.cargo/bin" ] && PATH="${HOME}/.cargo/bin:${PATH}"

# Snaps
SNAPBIN=/snap/bin
[ -d ${SNAPBIN} ] && PATH="${SNAPBIN}:${PATH}"

# Terraform Plugin Cache
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugins"
