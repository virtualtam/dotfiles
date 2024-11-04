# Docker helpers
#
# Formatting:
# - https://docs.docker.com/config/formatting/
# - https://docs.docker.com/engine/reference/commandline/images/
# - https://docs.docker.com/engine/reference/commandline/inspect/
# - https://docs.docker.com/engine/reference/commandline/ps/
# - https://docs.docker.com/engine/reference/commandline/search/
# - https://www.katacoda.com/courses/docker/formatting-ps-output
# - https://container42.com/2016/03/27/docker-quicktip-7-psformat/
# - https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host
#
# Registry:
# - https://docs.docker.com/registry/spec/api/
# - https://stackoverflow.com/questions/24481564/how-can-i-find-docker-image-with-specific-tag-in-docker-registry-in-docker-comma

function dk --description 'Docker wrapper with concise output'
    # Docker Hub - Public image registry
    set DOCKER_HUB_URL 'https://registry.hub.docker.com'
    set DOCKER_HUB_REPO_URL "$DOCKER_HUB_URL/v2/repositories"

    set cmd $argv[1]

    switch $cmd
    case img
            set fmt 'table {{.Repository}}\t{{.Tag}}\t{{.Size}}'
            docker images --format $fmt
    case ip
            set fmt '{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}'
            docker inspect --format $fmt $argv[2..-1]
    case mac
            set fmt '{{range .NetworkSettings.Networks}}{{println .MacAddress}}{{end}}'
            docker inspect --format $fmt $argv[2..-1]
    case port
            set fmt '{{range $p, $conf := .NetworkSettings.Ports}}{{printf "%s -> %s\n" $p (index $conf 0).HostPort}}{{end}}'
            docker inspect --format $fmt $argv[2..-1]
    case ps
            set fmt 'table {{.Names}}\t{{.Image}}\t{{.Ports}}'
            docker ps --format $fmt $argv[2..-1]
    case search
            set fmt 'table {{.Name}}\t{{printf "%.40s" .Description}}\t{{.IsOfficial}}\t{{.StarCount}}'
            docker search --limit 5 --filter stars=1 --format $fmt $argv[2..-1]
    case search-tags
            for image in $argv[2..-1]
                echo "Searching tags for image: $image"

                if ! string match '*/*' $image
                    set image "library/$image"
                end

                curl -s -S "$DOCKER_HUB_REPO_URL/$image/tags/" \
                    | jq -c -M -r '."results"[]["name"]' \
                    | sort -V
                echo
            end
    case tail
            docker logs --tail=100 -f $argv[2..-1]
    case prune
            for component in container image network volume
                echo "== Pruning "$component"s =="
                docker $component prune --force
            end
    case x
            docker exec -ti $argv[2..-1]
    case xb
            docker exec -ti $argv[2] bash
    case xs
            docker exec -ti $argv[2] sh
    case '*'
            docker $argv
    end
end

