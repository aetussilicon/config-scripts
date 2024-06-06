#!/bin/bash

# Função para verificar o status do Bluetooth
get_bluetooth_status() {
    bluetoothctl show | grep -q "Powered: yes"
}

# Função para verificar se há dispositivos conectados
get_connected_devices() {
    bluetoothctl info | grep -q "Connected: yes"
}

# Função para alternar o Bluetooth
toggle_bluetooth() {
    if get_bluetooth_status; then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
}

# Se o script for chamado com o argumento "toggle", alterna o Bluetooth
if [ "$1" == "toggle" ]; then
    toggle_bluetooth
    sleep 1
fi

# Determina o ícone e o texto a ser exibido no Polybar
if get_bluetooth_status; then
    if get_connected_devices; then
        icon="%{F#00FF00}%{F-}"  # Ícone de dispositivo conectado (verde)
    else
        icon="%{F#00FF00}%{F-}"  # Ícone de Bluetooth ligado (verde)
    fi
else
    icon="%{F#FF0000}%{F-}"  # Ícone de Bluetooth desligado (vermelho)
fi

# Imprime o ícone
echo "$icon"

