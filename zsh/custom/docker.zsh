#!/bin/zsh
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

# Docker Hub - Public image registry
DOCKER_HUB_URL=https://registry.hub.docker.com
DOCKER_HUB_REPO_URL=${DOCKER_HUB_URL}/v2/repositories

# Formatting options
DOCKER_IMG_FMT='table {{.Repository}}\t{{.Tag}}\t{{.Size}}'
DOCKER_IP_FMT='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'
DOCKER_MAC_FMT='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}'
DOCKER_PORT_FMT='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}'
DOCKER_PS_FMT='table {{.Names}}\t{{.Image}}\t{{.Ports}}'
DOCKER_SEARCH_FMT='table {{.Name}}\t{{printf "%.40s" .Description}}\t{{.IsOfficial}}\t{{.StarCount}}'

function dk() {
    command="${1}"
    shift

    case "${command}" in
        img)
            docker images --format ${DOCKER_IMG_FMT}
            ;;
        ip)
            docker inspect --format ${DOCKER_IP_FMT} $@
            ;;
        mac)
            docker inspect --format ${DOCKER_MAC_FMT} $@
            ;;
        port)
            docker inspect --format ${DOCKER_PORT_FMT} $@
            ;;
        ps)
            docker ps --format ${DOCKER_PS_FMT} $@
            ;;
        search)
            docker search --limit 5 --filter stars=1 --format ${DOCKER_SEARCH_FMT} $@
            ;;
        search-tags)
            for image in $@
            do
                echo "Searching tags for image: ${image}"
                [[ ! -z "${image##*/*}" ]] && image="library/${image}"
                curl -s -S "${DOCKER_HUB_REPO_URL}/${image}/tags/" \
                    | jq -c -M -r '."results"[]["name"]' \
                    | sort -V
                echo
            done
            ;;
        tail)
            docker logs --tail=100 -f $@
            ;;
        prune)
            for component in container image network volume
            do
                echo "== Pruning ${component}s =="
                docker ${component} prune --force
            done
            ;;
        x)
            docker exec -ti $@
            ;;
        *)
            docker ${command} $@
            ;;
    esac
}
