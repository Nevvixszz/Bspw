#!/bin/bash

# Убиваем старые процессы
killall -q polybar

# Ждем завершения
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запускаем бар на всех мониторах
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar main &
done
