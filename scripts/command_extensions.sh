#!/usr/bin/env bash

function resolve_label {
    if [ -z "$1" ]; then
        return 1
    fi

    local dir=$(grep "^$1 " ~/.dirs | cut -d' ' -f2-)
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
    local -n _args_out=$1
    shift
    for arg in "$@"
    do
        if [[ $arg == \#* && $arg != \\#* ]]; then
            local label_name="${arg#\#}"   # Remove the '#' at the beginning
            local resolved_path=$(resolve_label "$label_name")

            if [ -n "$resolved_path" ]; then
                _args_out+=("$resolved_path")
            else
                _args_out+=("$arg")
            fi
        else
            _args_out+=("$arg")
        fi
    done
}


function cd {
    local path="$(resolve_path_or_label "$1")"
    builtin cd "$path"
}

function cp {
    local args=()
    process_args args "$@"
    builtin cp "${args[@]}"
}

function mv {
    local args=()
    process_args args "$@"
    builtin mv "${args[@]}"
}

function mkdir {
    local args=()
    process_args args "$@"
    builtin mkdir "${args[@]}"
}

function rmdir {
    local args=()
    process_args args "$@"
    builtin rmdir "${args[@]}"
}

function rm {
    local args=()
    process_args args "$@"
    builtin rm "${args[@]}"
}

function ln {
    local args=()
    process_args args "$@"
    builtin ln "${args[@]}"
}

function chmod {
    local args=()
    process_args args "$@"
    builtin chmod "${args[@]}"
}

function chown {
    local args=()
    process_args args "$@"
    builtin chown "${args[@]}"
}

function ls {
    local args=()
    process_args args "$@"
    builtin ls "${args[@]}"
}

function touch {
    local args=()
    process_args args "$@"
    builtin touch "${args[@]}"
}

function cat {
    local args=()
    process_args args "$@"
    builtin cat "${args[@]}"
}

function grep {
    local args=()
    process_args args "$@"
    builtin grep "${args[@]}"
}

function find {
    local args=()
    process_args args "$@"
    builtin find "${args[@]}"
}

function echo {
    local args=()
    process_args args "$@"
    builtin echo "${args[@]}"
}

function diff {
    local args=()
    process_args args "$@"
    builtin diff "${args[@]}"
}

function tail {
    local args=()
    process_args args "$@"
    builtin tail "${args[@]}"
}

function head {
    local args=()
    process_args args "$@"
    builtin head "${args[@]}"
}

function less {
    local args=()
    process_args args "$@"
    builtin less "${args[@]}"
}

