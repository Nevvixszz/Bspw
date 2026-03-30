#!/bin/bash

# Получаем внешний IP через curl
IP=$(curl -s ifconfig.me)

if [ -n "$IP" ]; then
    echo "🌐 $IP"
else
    echo "❌ Нет сети"
fi
