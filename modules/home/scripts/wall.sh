kil() {
    cids=`ps -o pid= --ppid $1 2>/dev/null`
    kill $cids $1 2>/dev/null
}

die() {
    bg_id=`cat /tmp/bg_id 2>/dev/null`
    [[ $bg_id == $$ ]] && rm /tmp/bg_id
    exit 0
}

trap die SIGINT
trap die SIGTERM

[[ -f /tmp/bg_id ]] && kil `cat /tmp/bg_id`
echo $$ > /tmp/bg_id

iter=60
wall_dir=/cmn/anime_pictures
while getopts ":n:d:" opt; do
    case $opt in
        n) iter="$OPTARG";;
        d) wall_dir="$OPTARG";;
        *) ;;
    esac
done

[[ ! -d "$wall_dir" ]] && die

for img in `find "$wall_dir" | shuf`; do
    swww img -t random "$img"
    echo "$img" >> /tmp/curr_bg
    sleep "$iter"
done
