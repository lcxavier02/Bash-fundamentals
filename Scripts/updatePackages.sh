#!/bin/bash

run_command_with_confirmation() {
    command="$1"
    confirmation_message="$2"

    zenity --question --text="$confirmation_message" --title="Confirmación" || exit 1

    eval "$command"

    if [ $? -eq 0 ]; then
        zenity --info --text="Operación completada con éxito." --title="Éxito"
    else
        zenity --error --text="Error al ejecutar el comando." --title="Error"
    fi
}

run_command_with_confirmation "sudo -S apt update" "¿Deseas actualizar la lista de paquetes?"

run_command_with_confirmation "sudo -S apt upgrade -y" "¿Deseas actualizar los paquetes?"

run_command_with_confirmation "sudo -S apt dist-upgrade -y" "¿Deseas actualizar el sistema?"
