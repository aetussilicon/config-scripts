#!/bin/bash

battery_icon_full=$'\uf240'
battery_icon_three_quarter=$'\uf241'
battery_icon_half=$'\uf242'
battery_icon_quarter=$'\uf243'
battery_icon_empty=$'\uf244'

charging_progress=$'\ue55b'
charging_done=$'\ue55c'

# Obtém o status da bateria
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

# Determina o ícone e a cor a ser usado com base na capacidade da bateria
if [[ "$battery_status" == "Charging" ]]; then
    if [ "$battery_capacity" -ge 80 ]; then
        icon="" # Charging (Full) 
        color="#00FF00" # Verde
    elif [ "$battery_capacity" -ge 60 ]; then
        icon="" # Charging (High)
        color="#ADFF2F" # Verde Amarelado
    elif [ "$battery_capacity" -ge 40 ]; then
        icon="" # Charging (Medium)
        color="#FFFF00" # Amarelo
    elif [ "$battery_capacity" -ge 20 ]; then
        icon="" # Charging (Low)
        color="#FFA500" # Laranja
    else
        icon="" # Charging (Very Low)
        color="#FF0000" # Vermelho
    fi
else
    if [ "$battery_capacity" -ge 80 ]; then
        icon=${battery_icon_full} # Charging (Full)
        #icon="" # Full
        color="#00FF00" # Verde
    elif [ "$battery_capacity" -ge 60 ]; then
        icon=${battery_icon_three_quarter} # High
        color="#ADFF2F" # Verde Amarelado
    elif [ "$battery_capacity" -ge 50 ]; then
        icon=${battery_icon_half}
        color="ADFF2F"
    elif [ "$battery_capacity" -ge 30 ]; then
        icon=${battery_icon_quarter} 
        color="#FFA500"
    elif [ "$battery_capacity" -ge 15 ]; then
        icon=${battery_icon_empty} # Low
        color="#FF0000" # Laranja
    else
        icon=${battery_icon_empty} # Very Low
        color="#FF0000" # Vermelho
    fi
fi

# Imprime o ícone, a cor e a capacidade da bateria
echo "%{F$color}$icon $battery_capacity%%{F-}"

