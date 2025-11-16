#compdef memo

_memo() {
    local -a commands
    commands=(
        'add:Add a new memo'
        'list:List all memos' 
        'search:Search memos'
        'show:Show memo details'
        'delete:Delete memo or all category'
        'categories:List categories'
        'stats:Show statistics'
        'config:Configure settings'
        'help:Show help'
    )

    _arguments \
        '--category[Specify category]:category:_files -W "$HOME/.memo/" -g "*.memos(:r)"' \
        '--desc[Description]:description:' \
        '1:command:->commands' \
        '*::args:->args'

    case $state in
        commands)
            _describe 'commands' commands
            ;;
    esac
}

_memo "$@"