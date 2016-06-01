PHPUNIT_VENDOR="./vendor/phpunit/phpunit/phpunit"
PHPUNIT_GLOBAL=$(/usr/bin/which phpunit)
PHPUNIT_EXIST=true

# Check if phpunit exist in vendor or globally
if [ ! -x "$PHPUNIT_VENDOR" ] && [ ! -x "$PHPUNIT_GLOBAL" ]
then
    PHPUNIT_EXIST=false
fi

###
# Execute phpunit
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

    if [ "$1" != "" ] && [ -x "$PHPUNIT_VENDOR" ]
    then
        $PHPUNIT_VENDOR -c "$1"
    elif [ "$1" = "" ] && [ -x "$PHPUNIT_VENDOR" ]
    then
        $PHPUNIT_VENDOR -c app/
    elif [ "$1" != "" ] && [ -x "$PHPUNIT_GLOBAL" ]
    then
        $PHPUNIT_GLOBAL -c "$1"
    else
        $PHPUNIT_GLOBAL -c app/
    fi
}

###
# Generate phpunit code coverage in html
#
# usage examples :
#
# punit-coverage MY_DESTINATION_FOLDER
# punit-coverage /tmp
###
punit-coverage() {
    if [ $PHPUNIT_EXIST = false ]
    then
        echo "The command 'phpunit' was not found"
        return
    fi

    FORMAT='--coverage-html'
    FOLDER='.'

    if [ "$1" != "" ]
    then
        FOLDER="$1"
    fi

    if [ -x "$PHPUNIT_VENDOR" ]
    then
        $PHPUNIT_VENDOR $COVERAGE_FORMAT $FOLDER
    else
        $PHPUNIT_GLOBAL $COVERAGE_FORMAT $FOLDER
    fi
}
