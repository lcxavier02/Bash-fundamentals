#! /bin/bash

ALL_USERS=$(getent passwd | cut -d: -f1)

zenity --list --title="Lista de usurios" --text="Usuarios existentes en el sistema" --column="Usuarios" $ALL_USERS --width=300 --height=200 --hide-header