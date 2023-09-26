#!/usr/bin/env bash

function resolve_label {
    if [ -z "$1" ]; then
        return 1
    fi

    #echo "Checking ig $HOME/.dirs exist..."
    if [ ! -f "$HOME/.dirs" ]
    then
        #echo "Does not exist  - creating"
        touch "$HOME/.dirs"
    fi

    local dir=$(grep "^$1 " "$HOME/.dirs" | cut -d' ' -f2-)
    if [ -z "$dir" ]; then
        return 1
    fi

    echo "$dir"
}

function resolve_path_or_label {
    local input_path="$1"
    local resolved_path=$(resolve_label "$input_path")

    if [ -z "$resolved_path" ]; then
        echo "$input_path"
    else
        echo "$resolved_path"
    fi
}

function process_args {
    local _args_out=$1
    shift
    for arg in "$@"
    do
        #printf "\nCurrent arg is {%s}" "$arg" 1>&2 
        if [[ $arg == \@* && $arg != \\@* ]]; then
            local label_name="${arg#\@}"   # Remove the '@' at the beginning
            llocal path_suffix=""

            if [[ $label_name == */* ]]; then  # ensure we are taking something only if path slash ws found
                path_suffix="${label_name#*/}" # overwise keep path_suffix empty
            fi

            label_name="${label_name%%/*}" # take only until first path slash
            local resolved_path=$(resolve_label "$label_name")

            printf "\nlabel_name: {%s}   resolved_path: {%s}" "$label_name" "$resolved_path" 1>&2 
            if [ -n "$resolved_path" ]; then
                eval "$_args_out+=(\"$resolved_path/$path_suffix\")"
            else
                eval "$_args_out+=(\"$arg\")"
            fi
        else
            eval "$_args_out+=(\"$arg\")"
        fi
    done
}


# function cd {
#     local path="$(resolve_path_or_label "$1")"
#     command cd "$path"
# }

function cp {
    #printf "\ncp called" 1>&2 
    local args=()
    process_args args "$@"
    command cp "${args[@]}"
}

function mv {
    #printf "\nmv called" 1>&2
    local args=()
    process_args args "$@"
    command mv "${args[@]}"
}

function mkdir {
    #printf "\nmkdir called" 1>&2
    local args=()
    process_args args "$@"
    command mkdir "${args[@]}"
}

function rmdir {
    #printf "\nrmdir called" 1>&2
    local args=()
    process_args args "$@"
    command rmdir "${args[@]}"
}

function rm {
    #printf "\nrm called" 1>&2
    local args=()
    process_args args "$@"
    command rm "${args[@]}"
}

function ln {
    #printf "\nln called" 1>&2
    local args=()
    process_args args "$@"
    command ln "${args[@]}"
}

function chmod {
    #printf "\nchmod called" 1>&2
    local args=()
    process_args args "$@"
    command chmod "${args[@]}"
}

function chown {
    #printf "\nchown called" 1>&2
    local args=()
    process_args args "$@"
    command chown "${args[@]}"
}

function ls {
    #printf "\nls called" 1>&2
    local args=()
    process_args args "$@"
    command ls "${args[@]}"
}

function touch {
    #printf "\ntouch called" 1>&2
    local args=()
    process_args args "$@"
    command touch "${args[@]}"
}

function cat {
    #printf "\ncat called" 1>&2
    local args=()
    process_args args "$@"
    command cat "${args[@]}"
}

function grep {
    #printf "\ngrep called" 1>&2
    local args=()
    process_args args "$@"
    command grep "${args[@]}"
}

function find {
    #printf "\nfind called" 1>&2
    local args=()
    process_args args "$@"
    command find "${args[@]}"
}

# function echo {
#     local args=()
#     process_args args "$@"
#     command echo "${args[@]}"
# }

function diff {
    #printf "\ndiff called" 1>&2
    local args=()
    process_args args "$@"
    command diff "${args[@]}"
}

function tail {
    #printf "\ntail called" 1>&2
    local args=()
    process_args args "$@"
    command tail "${args[@]}"
}

function head {
    #printf "\nhead called" 1>&2
    local args=()
    process_args args "$@"
    command head "${args[@]}"
}

function less {
    #printf "\nless called" 1>&2
    local args=()
    process_args args "$@"
    command less "${args[@]}"
}

