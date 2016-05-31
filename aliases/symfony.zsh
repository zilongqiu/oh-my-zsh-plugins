###
# Check phpunit exist
###
function checkPhpUnit () {
    if [ ! -x "$1" ] && [ ! -x "$2" ]
    then
        echo false
        return
    fi

    echo true
    return
}

###
# Phpunit aliases
#
# With execution priority to the vendor phpunit
#
# usage examples :
#
# punit
# punit app/
###
punit() {
    phpunit1="./vendor/phpunit/phpunit/phpunit"
    phpunit2=$(/usr/bin/which phpunit)

    if [ $(checkPhpUnit "$phpunit1" "$phpunit2") = false ]
    then
        echo "The command 'phpunit' was not found"
        return
    fi

    if [ "$1" != "" ] && [ -x "$phpunit1" ]
    then
        $phpunit1 -c "$1"
    elif [ "$1" = "" ] && [ -x "$phpunit1" ]
    then
        $phpunit1 -c app/
    elif [ "$1" != "" ] && [ -x "$phpunit2" ]
    then
        $phpunit2 -c "$1"
    else
        $phpunit2 -c app/
    fi
}

