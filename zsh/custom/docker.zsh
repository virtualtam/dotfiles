#!/bin/zsh
# Docker helpers
#
# See:
# - https://docs.docker.com/config/formatting/
# - https://docs.docker.com/engine/reference/commandline/images/
# - https://docs.docker.com/engine/reference/commandline/inspect/
# - https://docs.docker.com/engine/reference/commandline/ps/
# - https://www.katacoda.com/courses/docker/formatting-ps-output
# - https://container42.com/2016/03/27/docker-quicktip-7-psformat/
# - https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host

# Formatting options
DOCKER_IMG_FMT='table {{.Repository}}\t{{.Tag}}\t{{.Size}}'
DOCKER_IP_FMT='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'
DOCKER_MAC_FMT='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}'
DOCKER_PORT_FMT='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}'
DOCKER_PS_FMT='table {{.Names}}\t{{.Image}}\t{{.Ports}}'

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
        *)
            docker ${command} $@
            ;;
    esac
}
