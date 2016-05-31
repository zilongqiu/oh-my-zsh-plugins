taildir() {
    if [ "$1" != "" ]
    then
        watch "ls -lrt $@ | tail -10"
    else
        watch "ls -lrt | tail -10"
    fi
}