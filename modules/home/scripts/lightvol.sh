vol=
light=
sound=

while getopts ":sv:l:" opt; do
    case "$opt" in
        s) sound=1;;
        v) vol="$OPTARG";;
        l) light="$OPTARG";;
        *) ;;
    esac
done

[[ -n $vol ]] && eval "amixer $vol &>/dev/null"
[[ -n $light ]] && eval "light $light &>/dev/null"
[[ -n $sound ]] && play "/run/current-system/sw/share/sounds/freedesktop/stereo/audio-volume-change.oga" &>/dev/null &

true
