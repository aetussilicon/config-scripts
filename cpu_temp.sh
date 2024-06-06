#!/bin/bash

# Obtém todas as temperaturas da CPU
temps=$(sensors | grep 'Core' | awk '{print $3}' | sed 's/+//;s/°C//')

# Inicializa variáveis
sum=0
count=0

# Calcula a soma das temperaturas e a contagem de núcleos
for temp in $temps; do
    sum=$(echo $sum + $temp | bc)
    count=$((count + 1))
done

# Calcula a média
if [ $count -gt 0 ]; then
    avg=$(echo "scale=2; $sum / $count" | bc)
    echo "$avg°C"
else
    echo "Sem temp."
fi

