# Homebrew
if test -x /opt/homebrew/bin/brew
    set -gx HOMEBREW_NO_ENV_HINTS 1
    /opt/homebrew/bin/brew shellenv | source

    # Applications
    fish_add_path --global --move ~/.codeium/windsurf/bin
end
