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
# dbuild MY_TAG_NAME
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
