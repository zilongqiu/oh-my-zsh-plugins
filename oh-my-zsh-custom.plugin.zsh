DIRECTORY_CURRENT_EXECUTION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIRECTORY_PROJECT=`dirname $0`
DIRECTORY_ALIAS=$DIRECTORY_PROJECT/aliases

# Aliases
source $DIRECTORY_ALIAS/git.zsh
source $DIRECTORY_ALIAS/docker.zsh
source $DIRECTORY_ALIAS/phpunit.zsh
source $DIRECTORY_ALIAS/custom.zsh
