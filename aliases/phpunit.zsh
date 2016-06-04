PHPUNIT_VENDOR="./vendor/phpunit/phpunit/phpunit"
PHPUNIT_GLOBAL=$(which phpunit)
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

    CONFIGURATION_FILE="app/"
    DIRECTORY_OR_FILE=""

    if [ "$1" != "" ]; then CONFIGURATION_FILE="$1"; fi
    if [ "$2" != "" ]; then DIRECTORY_OR_FILE="$2"; fi

    if [ "$1" != "" ] && [ -x "$PHPUNIT_VENDOR" ]
    then
        $PHPUNIT_VENDOR -c $CONFIGURATION_FILE $DIRECTORY_OR_FILE
    elif [ "$1" = "" ] && [ -x "$PHPUNIT_VENDOR" ]
    then
        $PHPUNIT_VENDOR -c app/
    elif [ "$1" != "" ] && [ -x "$PHPUNIT_GLOBAL" ]
    then
        $PHPUNIT_GLOBAL -c $CONFIGURATION_FILE $DIRECTORY_OR_FILE
    else
        $PHPUNIT_GLOBAL -c app/
    fi
}

###
# Generate phpunit code coverage in html
#
# usage examples :
#
# punitc MY_DESTINATION_FOLDER
# punitc /tmp
###
punitc() {
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
