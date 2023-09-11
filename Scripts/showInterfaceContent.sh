#! /bin/bash

CONINTER=$(cat /etc/network/interfaces)

zenity --info --text="${CONINTER}"