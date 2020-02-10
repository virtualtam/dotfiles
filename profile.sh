# ~/.profile

if [ -n "${BASH_VERSION}" ]; then
    [ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
elif [ -n "${ZSH_VERSION}" ]; then
    [ -f "${HOME}/.zshrc" ] && . "${HOME}/.zshrc"
fi

# User binaries
[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# Qt5 theme management
export QT_QPA_PLATFORMTHEME="qt5ct"

# Go
export GOPATH="${HOME}/.golang"
export GOBIN="${GOPATH}/bin"
[ -d "${GOBIN}" ] && PATH="${GOBIN}:${PATH}"

# Java
export JAVA_FONTS='/usr/share/fonts/TTF'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'\
' -Dswing.aatext=true'\
' -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# NodeJS
[ -d "${HOME}/.node_modules/bin" ] && PATH="${HOME}/.node_modules/bin:${PATH}"
[ -d "${HOME}/.yarn/bin" ] && PATH="${HOME}/.yarn/bin:${PATH}"
[ -f /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# Snaps
SNAPBIN=/snap/bin
[ -d ${SNAPBIN} ] && PATH="${SNAPBIN}:${PATH}"

# Terraform Plugin Cache
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugin-cache"
