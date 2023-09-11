#! /bin/bash

connections_list=$(netstat -tuln)

zenity --text-info --title="Lista de conexiones de red" --width=800 --height=400 --filename=<(echo "${connections_list}")

exit 0