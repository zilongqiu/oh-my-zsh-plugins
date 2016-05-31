PHPUNIT_VENDOR="./vendor/phpunit/phpunit/phpunit"
PHPUNIT_GLOBAL=$(/usr/bin/which phpunit)
PHPUNIT_EXIST=true

# Check if phpunit exist in vendor or globally
if [ ! -x "$PHPUNIT_VENDOR" ] && [ ! -x "$PHPUNIT_GLOBAL" ]
then
    PHPUNIT_EXIST=false
fi

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
    if [ $PHPUNIT_EXIST = false ]
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
