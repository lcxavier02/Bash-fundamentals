#!/bin/bash

file_or_dir=$(zenity --file-selection --title="Selecciona un archivo o carpeta:" )

if [ -z "$file_or_dir" ]; then
  zenity --info --title="Operación Cancelada" --text="No se han cambiado los permisos."
  exit 1
fi

permissions_help="Ingresa los permisos en formato octal (por ejemplo, 755):
- El primer dígito representa los permisos del propietario.
- El segundo dígito representa los permisos del grupo.
- El tercer dígito representa los permisos para otros.
Cada dígito es una combinación de:
- 4 para lectura (r).
- 2 para escritura (w).
- 1 para ejecución (x).
Por ejemplo, 755 otorga permisos de lectura, escritura y ejecución al propietario, y permisos de lectura y ejecución al grupo y otros."

new_permissions=$(zenity --entry --title="Cambiar Permisos" --text="$permissions_help")

if [ -z "$new_permissions" ]; then
  zenity --info --title="Operación Cancelada" --text="No se han cambiado los permisos."
  exit 1
fi

chmod "$new_permissions" "$file_or_dir"

if [ $? -eq 0 ]; then
  zenity --info --title="Cambios Realizados" --text="Los permisos de '$file_or_dir' han sido cambiados a '$new_permissions' con éxito."
else
  zenity --error --title="Error al Cambiar Permisos" --text="No se pudieron cambiar los permisos de '$file_or_dir'."
fi

exit 0
