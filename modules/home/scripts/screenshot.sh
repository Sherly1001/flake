usage() {
cat <<END
usage:
  $0 [options]
  options:
    -h          show this help
    -f          capture fullscreen
    -s FILE     save screenshot to file, otherwise save to clipboard
END
exit 0
}

while getopts ":hfs:" opt; do
    case "$opt" in
        f) FULL=1;;
        s) SAVE="$OPTARG";;
        h) usage;;
        *) ;;
    esac
done

if [[ -z "$FULL" ]]; then
    slurp="$(slurp 2>/dev/null)"
    [[ -n "$slurp" ]] && geo="-g '$slurp'" || exit 0
fi

if [[ -n "$SAVE" ]]; then
    out="$SAVE"
else
    out="$(mktemp)"
    rmout=1
fi

eval "grim $geo '$out'"
[[ -n "$rmout" ]] && wl-copy < "$out" && rm "$out" || true
