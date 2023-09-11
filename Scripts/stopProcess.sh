#!/bin/bash

process_list=$(ps aux | awk '{print $2, $11}')

selected_pid=$(zenity --list --title="Seleccionar un Proceso para Detener" --text="Selecciona un proceso para detener (PID Nombre):" --column="PID" --column="Nombre" --hide-header $process_list --width=600 --height=400)

if [ $? -eq 1 ]; then
  zenity --info --title="Operación Cancelada" --text="No se ha detenido ningún proceso."
  exit 1
fi

selected_pid=$(echo "$selected_pid" | awk '{print $1}')

if kill -9 "$selected_pid" 2>/dev/null; then
  zenity --info --title="Proceso Detenido" --text="El proceso con PID $selected_pid ha sido detenido correctamente."
else
  zenity --error --title="Error al Detener Proceso" --text="No se pudo detener el proceso con PID $selected_pid."
fi

exit 0
