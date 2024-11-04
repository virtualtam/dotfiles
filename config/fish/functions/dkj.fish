function dkj --description 'Inspect a Docker container and filter the result with jq' --wraps 'docker inspect'
    argparse h/help -- $argv
    or return

    if test (count $argv) -eq 1
        set container $argv[1]
    else
        set section $argv[1]
        set container $argv[2]
    end

    if set -ql _flag_help
    or test -z $container
        echo "dkj [-h|--help] [labels|mounts|net] CONTAINER"
        return 0
    end

    set jq_filter ""

    switch $section
    case labels
        set jq_filter ".[0].Config.Labels"
    case mounts
        set jq_filter ".[0].Mounts"
    case net
        set jq_filter ".[0].NetworkSettings.Networks"
    case '*'
        set jq_filter ".[0]"
    end

    docker inspect $container | jq $jq_filter
end
