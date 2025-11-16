# bash completion for memo
_memo() {
    local cur prev words cword
    _init_completion || return

    local commands="add list search show delete categories stats config help"

    case "${prev}" in
        --category|-c)
            # Complete categories for add/search/show/delete commands
            local categories=()
            if [[ -d "$HOME/.memo" ]]; then
                while IFS= read -r file; do
                    categories+=("$(basename "$file" .memos)")
                done < <(find "$HOME/.memo" -name "*.memos" -type f 2>/dev/null)
            fi
            COMPREPLY=($(compgen -W "${categories[*]}" -- "$cur"))
            return 0
            ;;
        --desc|-d)
            # No completion for description
            COMPREPLY=()
            return 0
            ;;
        memo)
            COMPREPLY=($(compgen -W "$commands" -- "$cur"))
            return 0
            ;;
    esac
}

complete -F _memo memo