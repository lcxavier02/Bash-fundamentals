#!/bin/bash

network_info=$(netstat -tuln | awk 'NR>2 {print $1, $4, $5}')

zenity --list --title="Conexiones de Red" --text="Información de conexiones de red:" \
  --column="Protocolo" --column="Dirección Local" --column="Dirección Remota" $network_info --width=800 --height=400

exit 0
