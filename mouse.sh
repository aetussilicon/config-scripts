#!/bin/bash

# Velocidade do ponteiro do mouse
xinput --set-prop 9 "Device Accel Constant Deceleration" 2.5

# Rolagem natural
xinput --set-prop 9 "libinput Natural Scrolling Enabled" 1

# Toque para clicar
xinput --set-prop 9 "libinput Tapping Enabled" 1

# Dois dedos para menu de contexto
xinput --set-prop 9 "libinput Click Method Enabled" 1, 1

