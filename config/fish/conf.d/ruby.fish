if test -d /opt/homebrew/opt/ruby/bin
    fish_add_path --global --move /opt/homebrew/opt/ruby/bin
end

if which ruby >/dev/null && which gem >/dev/null
    fish_add_path --global --move (ruby -r rubygems -e 'puts Gem.user_dir')/bin
end

if which rbenv >/dev/null
    rbenv init - | source
end
