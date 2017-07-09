# ~/.profile

if [ -n "${BASH_VERSION}" ]; then
    [ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
elif [ -n "${ZSH_VERSION}" ]; then
    [ -f "${HOME}/.zshrc" ] && . "${HOME}/.zshrc"
fi

[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# Qt5 theme management
export QT_QPA_PLATFORMTHEME="qt5ct"

# Java
export JAVA_FONTS='/usr/share/fonts/TTF'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'\
' -Dswing.aatext=true'\
' -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Go
export GOPATH="${HOME}/.golang"
export GOBIN="${GOPATH}/bin"

[ -d "${GOBIN}" ] && PATH="${GOBIN}:${PATH}"
