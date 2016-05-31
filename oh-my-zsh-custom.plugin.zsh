# TEST install
alias testzilong="echo It works"

# GIT aliases
# DOCKER aliases
# PHPUNIT aliases
# OTHERS aliases
taildir() {
    if [ "$1" != "" ]
    then
        watch "ls -lrt $@ | tail -10"
    else
        watch "ls -lrt | tail -10"
    fi
}
