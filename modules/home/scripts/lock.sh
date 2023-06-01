wall_dir=/cmn/anime_pictures
img=`find "$wall_dir" | shuf | head -1`

swaylock \
    --image "$img" \
    --clock \
    --timestr '%R' \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --effect-blur 5x5 \
    --effect-vignette 0.5:0.5 \
    --ring-color bb00cc \
    --key-hl-color 880033 \
    --line-color 00000000 \
    --line-wrong-color 00000000 \
    --line-ver-color 00000000 \
    --line-clear-color 00000000 \
    --inside-color 00000088 \
    --inside-wrong-color 8b000088 \
    --text-wrong-color f6f5f4 \
    --separator-color 00000000
