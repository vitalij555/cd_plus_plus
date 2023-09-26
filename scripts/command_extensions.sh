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


function cppp {
    local args=()
    process_args args "$@"
    cp "${args[@]}"
}

function mvpp {
    local args=()
    process_args args "$@"
    mv "${args[@]}"
}

function mkdirpp {
    local args=()
    process_args args "$@"
    mkdir "${args[@]}"
}

function rmdirpp {
    local args=()
    process_args args "$@"
    rmdir "${args[@]}"
}

function rmpp {
    local args=()
    process_args args "$@"
    rm "${args[@]}"
}

function lnpp {
    local args=()
    process_args args "$@"
    ln "${args[@]}"
}

function chmodpp {
    local args=()
    process_args args "$@"
    chmod "${args[@]}"
}

function chownpp {
    local args=()
    process_args args "$@"
    chown "${args[@]}"
}

function lspp {
    local args=()
    process_args args "$@"
    ls "${args[@]}"
}

function touchpp {
    local args=()
    process_args args "$@"
    touch "${args[@]}"
}

function catpp {
    local args=()
    process_args args "$@"
    cat "${args[@]}"
}

function greppp {
    local args=()
    process_args args "$@"
    grep "${args[@]}"
}

function findpp {
    local args=()
    process_args args "$@"
    find "${args[@]}"
}

function diffpp {
    local args=()
    process_args args "$@"
    diff "${args[@]}"
}

function tailpp {
    local args=()
    process_args args "$@"
    tail "${args[@]}"
}

function headpp {
    local args=()
    process_args args "$@"
    head "${args[@]}"
}

function lesspp {
    local args=()
    process_args args "$@"
    less "${args[@]}"
}

