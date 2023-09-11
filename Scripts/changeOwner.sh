#!/bin/bash

change_option=$(zenity --list --title="Cambiar Propietario/Grupo" --text="Selecciona qué deseas cambiar:" \
  --column="Opción" "Propietario" "Grupo" "Ambos" --width=300 --height=200 --hide-header)

if [ $? -eq 1 ]; then
  zenity --info --title="Operación Cancelada" --text="No se ha realizado ningún cambio."
  exit 1
fi

file_or_dir=$(zenity --file-selection --title="Selecciona un archivo o directorio:")

if [ -z "$file_or_dir" ]; then
  zenity --info --title="Operación Cancelada" --text="No se ha realizado ningún cambio."
  exit 1
fi

if [ "$change_option" == "Propietario" ] || [ "$change_option" == "Ambos" ]; then
  new_owner=$(zenity --entry --title="Cambiar Propietario" --text="Ingresa el nuevo propietario (nombre de usuario o UID):")

  if [ -z "$new_owner" ]; then
    zenity --info --title="Operación Cancelada" --text="No se ha realizado ningún cambio."
    exit 1
  fi
fi

if [ "$change_option" == "Grupo" ] || [ "$change_option" == "Ambos" ]; then
  new_group=$(zenity --entry --title="Cambiar Grupo" --text="Ingresa el nuevo grupo (nombre de grupo o GID):")

  if [ -z "$new_group" ]; then
    zenity --info --title="Operación Cancelada" --text="No se ha realizado ningún cambio."
    exit 1
  fi
fi

if [ "$change_option" == "Propietario" ] || [ "$change_option" == "Ambos" ]; then
  sudo chown "$new_owner" "$file_or_dir"
fi

if [ "$change_option" == "Grupo" ] || [ "$change_option" == "Ambos" ]; then
  sudo chgrp "$new_group" "$file_or_dir"
fi

if [ $? -eq 0 ]; then
  zenity --info --title="Cambios Realizados" --text="Los cambios han sido realizados con éxito en '$file_or_dir'."
else
  zenity --error --title="Error al Cambiar Propietario/Grupo" --text="No se pudieron realizar los cambios en '$file_or_dir'."
fi

exit 0
