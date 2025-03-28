if test -d /opt/homebrew/opt/ruby/bin
    fish_add_path --global --move /opt/homebrew/opt/ruby/bin
end

if which ruby >/dev/null && which gem >/dev/null
    fish_add_path --global --move (ruby -r rubygems -e 'puts Gem.user_dir')/bin
end

if which rbenv >/dev/null
    fish_add_path --global --move ~/.rbenv/shims
    set -gx RBENV_SHELL fish

    command rbenv rehash 2>/dev/null

    function rbenv
        set command $argv[1]
        set -e argv[1]

        switch "$command"
        case rehash shell
            rbenv "sh-$command" $argv|source
        case '*'
            command rbenv "$command" $argv
        end
    end
end
