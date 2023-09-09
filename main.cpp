#include <iostream>
#include <cstdlib>
#include <unistd.h>

using namespace std;

int showMenu() {
    int option;
    cout << endl;
    cout << "1.- Mostrar conexiones de red" << endl;
    cout << "2.- Mostrar contenido del archivo de configuracion de interfaces de red" << endl;
    cout << "3.- Mostrar los usuarios existentes" << endl;
    cout << "4.- Agregar o eliminar un usuario" << endl;
    cout << "5.- Mostrar los procesos en ejecucion" << endl;
    cout << "6.- Detener un proceso en especifico" << endl;
    cout << "7.- Cambiar permisos a un archivo o directorio" << endl;
    cout << "8.- Cambiar propietario o grupo de un archivo o directorio" << endl;
    cout << "9.- Actualizar los paquetes instalados y el SO" << endl;
    cout << "10.- Salir del programa" << endl;
    cout << endl;
    cin >> option;

    return option;
}

int main() {

    int userSelection;

    do {
        userSelection = showMenu();
        system("clear");

        switch (userSelection) {
            case 1:
                cout << "Mostrando redes..." << endl;
                system(".././showConnections.sh");
                break;
            case 2:
                cout << "Opcion 2" << endl;
                break;
            case 3:
                cout << "Opcion 3" << endl;
                break;
            case 4:
                cout << "Opcion 4" << endl;
                break;
            case 5:
                cout << "Opcion 5" << endl;
                break;
            case 6:
                cout << "Opcion 6" << endl;
                break;
            case 7:
                cout << "Opcion 7" << endl;
                break;
            case 8:
                cout << "Opcion 8" << endl;
                break;
            case 9:
                cout << "Opcion 9" << endl;
                break;
            case 10:
                cout << "Opcion 10" << endl;
                break;
            default:
                cout << "Opcion default" << endl;
                break;
        }

    } while (userSelection != 10);

    return 0;
}
