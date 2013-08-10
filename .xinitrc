xsetroot -cursor_name left_ptr
xset -b &
xmodmap /home/huge/.xmodmap &
# xflux -l 48 -g 2 -k 3700 &
xset fp+ unix/:7101
exec xmonad
