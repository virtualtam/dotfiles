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

alias dkc='docker compose'

function dk() {
    local fmt=""
    local cmd="${1}"
    shift

    case "${cmd}" in
        img)
            fmt='table {{.Repository}}\t{{.Tag}}\t{{.Size}}'
            docker images --format ${fmt}
            ;;
        ip)
            fmt='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}'
            docker inspect --format ${fmt} $@
            ;;
        mac)
            fmt='{{range .NetworkSettings.Networks}}{{println .MacAddress}}{{end}}'
            docker inspect --format ${fmt} $@
            ;;
        port)
            fmt='{{range $p, $conf := .NetworkSettings.Ports}}{{printf "%s -> %s\n" $p (index $conf 0).HostPort}}{{end}}'
            docker inspect --format ${fmt} $@
            ;;
        ps)
            fmt='table {{.Names}}\t{{.Image}}\t{{.Ports}}'
            docker ps --format ${fmt} $@
            ;;
        search)
            fmt='table {{.Name}}\t{{printf "%.40s" .Description}}\t{{.IsOfficial}}\t{{.StarCount}}'
            docker search --limit 5 --filter stars=1 --format ${fmt} $@
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
        xb)
            docker exec -ti $1 bash
            ;;
        xs)
            docker exec -ti $1 sh
            ;;
        *)
            docker ${cmd} $@
            ;;
    esac
}

function dkj() {
    local cmd=""
    local jq_filter=""

    if [[ "$#" -gt 1 ]]
    then
        cmd="${1}"
        shift
    fi

    case "${cmd}" in
        labels)
            jq_filter=".[0].Config.Labels"
            ;;
        mounts)
            jq_filter=".[0].Mounts"
            ;;
        net)
            jq_filter=".[0].NetworkSettings.Networks"
            ;;
        *)
            jq_filter=".[0]"
            ;;
    esac

    docker inspect $@ | jq ${jq_filter}
}
