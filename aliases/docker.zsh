DOCKER=$(which docker)
DOCKER_EXIST=true

# Check if docker exist
if [ ! -x "$DOCKER" ]
then
    DOCKER_EXIST=false
fi

###
# Docker build
#
# usage example :
#
# dbuild test
# dbuild test:latest
###
dbuild() {
    if [ $DOCKER_EXIST = false ]
    then
        echo "The command 'docker' was not found"
        return
    fi

    if [ "$1" != "" ] && [ -x "$DOCKER" ]
    then
        $DOCKER build -t="$1" .
    else
        echo "The command 'docker build' expect the tag name"
    fi
}

###
# Docker run
#
# usage examples :
#
# drun php
# drun 970eaf375dfd
###
drun() {
    if [ $DOCKER_EXIST = false ]
    then
        echo "The command 'docker' was not found"
        return
    fi

    if [ "$1" != "" ] && [ -x "$DOCKER" ]
    then
        $DOCKER run -it "$1" /bin/bash
    else
        echo "The command 'docker run' expect the image name/hash"
    fi
}

###
# Docker inspect
#
# usage examples :
#
# dip php
# dip 970eaf375dfd
###
dip() {
    if [ $DOCKER_EXIST = false ]
    then
        echo "The command 'docker' was not found"
        return
    fi

    if [ "$1" != "" ] && [ -x "$DOCKER" ]
    then
        $DOCKER inspect --format '{{ .NetworkSettings.IPAddress }}' "$1"
    else
        echo "The command 'docker inspect' expect the container name/hash"
    fi
}

###
# Docker stats
#
# usage examples :
#
# dstats
# dstats php
# dstats 970eaf375dfd
###
dstats() {
    if [ $DOCKER_EXIST = false ]
    then
        echo "The command 'docker' was not found"
        return
    fi

    if [ "$1" != "" ] && [ -x "$DOCKER" ]
    then
        $DOCKER stats "$1"
    else
        $DOCKER stats
    fi
}
