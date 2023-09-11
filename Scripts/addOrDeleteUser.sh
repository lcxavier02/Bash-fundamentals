#!/bin/bash

action=$(zenity --list --title="Gestión de Usuarios" --text="Selecciona una acción:" --column="Acción" "Agregar Usuario" "Eliminar Usuario" --width=300 --height=200 --hide-header)

case $action in
  "Agregar Usuario")

    new_username=$(zenity --entry --title="Agregar Usuario" --text="Ingresa el nombre del nuevo usuario:")

    if [ $? -eq 1 ]; then
      zenity --info --title="Operación Cancelada" --text="No se ha agregado ningún usuario."
      exit 1
    fi

    sudo -S useradd "$new_username"
    zenity --info --title="Usuario Agregado" --text="El usuario '$new_username' ha sido agregado correctamente."
    ;;

  "Eliminar Usuario")

    all_users=$(getent passwd | cut -d: -f1)

    user_to_delete=$(zenity --list --title="Eliminar Usuario" --text="Selecciona un usuario para eliminar:" --column="Usuarios" $all_users --width=300 --height=200 --hide-header)

    if [ $? -eq 1 ]; then
      zenity --info --title="Operación Cancelada" --text="No se ha eliminado ningún usuario."
      exit 1
    fi

    sudo -S userdel "$user_to_delete"
    zenity --info --title="Usuario Eliminado" --text="El usuario '$user_to_delete' ha sido eliminado correctamente."
    ;;
esac

exit 0
