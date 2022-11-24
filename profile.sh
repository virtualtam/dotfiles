# ~/.profile

if [ -n "${BASH_VERSION}" ]; then
    [ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
elif [ -n "${ZSH_VERSION}" ]; then
    [ -f "${HOME}/.zshrc" ] && . "${HOME}/.zshrc"
fi

# SSH Agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Text Editor
export EDITOR="vim"
export VISUAL="${EDITOR}"

# User binaries
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# Qt5 theme management
export QT_QPA_PLATFORMTHEME="qt5ct"

# Erlang / Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Go
export GOPATH="${HOME}/.golang"
export GOBIN="${GOPATH}/bin"
[ -d "${GOBIN}" ] && PATH="${GOBIN}:${PATH}"

# Java / GraalVM
GRAALVM_HOME=/usr/lib/jvm/java-11-graalvm
[ -d ${GRAALVM_HOME} ] && export GRAALVM_HOME

# NodeJS
[ -d "${HOME}/.node_modules/bin" ] && PATH="${HOME}/.node_modules/bin:${PATH}"
[ -d "${HOME}/.yarn/bin" ] && PATH="${HOME}/.yarn/bin:${PATH}"
[ -f /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# Ruby
if which ruby >/dev/null && which gem >/dev/null
then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:${PATH}"
fi

# Rust
[ -d "${HOME}/.cargo/bin" ] && PATH="${HOME}/.cargo/bin:${PATH}"

# Snaps
SNAPBIN=/snap/bin
[ -d ${SNAPBIN} ] && PATH="${SNAPBIN}:${PATH}"

# Terraform Plugin Cache
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugins"
