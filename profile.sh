# ~/.profile

if [ -n "${BASH_VERSION}" ]; then
    [ -f "${HOME}/.bashrc" ] && . "${HOME}/.bashrc"
elif [ -n "${ZSH_VERSION}" ]; then
    [ -f "${HOME}/.zshrc" ] && . "${HOME}/.zshrc"
fi

[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:${PATH}"

# Qt5 theme management
QT_QPA_PLATFORMTHEME="qt5ct"

# Java (moved to $JAVA_HOME/jre/lib/swing.properties)
_JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# Go
export GOPATH="${HOME}/.golang"
export GOBIN="${GOPATH}/bin"

[ -d "${GOBIN}" ] && PATH="${GOBIN}:${PATH}"
