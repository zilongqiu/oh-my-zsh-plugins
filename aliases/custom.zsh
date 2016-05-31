###
# Taildir
#
# usage examples :
#
# taildir
# taildir *error.log
###
taildir() {
    watch=$(/usr/bin/which watch)

    if [ "$watch" -eq "" ]
    then
        echo "The command 'watch' was not found"
        return
    fi

    if [ "$1" != "" ]
    then
        watch "ls -lrt $@ | tail -10"
    else
        watch "ls -lrt | tail -10"
    fi
}

###
# Find file by name
#
# usage examples :
#
# findn . myfile.extension
# findn / *.extension
###
findn () {
    sudo find "$1" -name "$2"
}
