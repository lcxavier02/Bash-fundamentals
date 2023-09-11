#!/bin/bash

process_list=$(ps aux | awk '{print $2, $11}')

zenity --list --title="Lista de Procesos en Ejecución"  --text="Procesos" --column="PID" --column="Nombre" --hide-header $process_list --width=600 --height=400

exit 0
