while getopts ":s:" opt; do
    case "$opt" in
        s) setprop="$OPTARG";;
        *) ;;
    esac
done

active_window="$(hyprctl activewindow)"
active_addr="$(echo "$active_window" | head -1 | sed 's/^Window \([a-f0-9]\+\) .*$/0x\1/')"

if [[ -n "$setprop" ]]; then
    hyprctl setprop "address:$active_addr" $setprop
    exit 0
fi

if [[ -n "$@" ]]; then
    hyprctl $@
    exit
fi

sleep 3
hyprctl activewindow
