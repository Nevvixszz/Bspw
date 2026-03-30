#!/bin/bash
# ~/.config/bspwm/scripts/get_workspace_dots.sh

# Получаем список всех десктопов
desktops=$(bspc query -D)
focused=$(bspc query -D -d focused --names)

output=""

for desk in $desktops; do
    # Проверяем, есть ли окна на десктопе
    has_windows=$(bspc query -N -d "$desk" 2>/dev/null | wc -l)
    
    if [ "$desk" = "$focused" ]; then
        # Текущий десктоп — красная точка
        output+="%{F#FF5555}●%{F-} "
    elif [ "$has_windows" -gt 0 ]; then
        # Есть окна — оранжевая
        output+="%{F#FFB86C}●%{F-} "
    else
        # Нет окон — белая
        output+="%{F#F8F8F2}○%{F-} "
    fi
done

echo "$output"
