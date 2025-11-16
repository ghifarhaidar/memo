complete -c memo -f

# Commands
complete -c memo -n "__fish_use_subcommand" -a "add" -d "Add a new memo"
complete -c memo -n "__fish_use_subcommand" -a "list" -d "List all memos"
complete -c memo -n "__fish_use_subcommand" -a "search" -d "Search memos"
complete -c memo -n "__fish_use_subcommand" -a "show" -d "Show memo details"
complete -c memo -n "__fish_use_subcommand" -a "delete" -d "Delete memo or all category"
complete -c memo -n "__fish_use_subcommand" -a "categories" -d "List categories"
complete -c memo -n "__fish_use_subcommand" -a "stats" -d "Show statistics"
complete -c memo -n "__fish_use_subcommand" -a "config" -d "Configure settings"
complete -c memo -n "__fish_use_subcommand" -a "help" -d "Show help"

# Options for add command
complete -c memo -n "__fish_seen_subcommand_from add" -s c -l category -d "Specify category" -xa "(find ~/.memo -name '*.memos' -exec basename {} .memos \; 2>/dev/null)"
complete -c memo -n "__fish_seen_subcommand_from add" -s d -l desc -d "Description"