#include <iostream>
#include <cstdlib>

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
                system("../Scripts/./showConnections.sh");
                break;
            case 2:
                cout << "Mostrando contenido de las interfaces..." << endl;
                system("../Scripts/./showInterfaceContent.sh");
                break;
            case 3:
                cout << "Mostrando usuarios existentes..." << endl;
                system("../Scripts/./showUsers.sh");
                break;
            case 4:
                cout << "Añadiendo o eliminando usuario..." << endl;
                system("../Scripts/./addOrDeleteUser.sh");
                break;
            case 5:
                cout << "Mostrando los procesos..." << endl;
                system("../Scripts/./showProcesses.sh");
                break;
            case 6:
                cout << "Deteniendo un proceso..." << endl;
                system("../Scripts/./stopProcess.sh");
                break;
            case 7:
                cout << "Cambiando permisos..." << endl;
                system("../Scripts/./changePermissions.sh");
                break;
            case 8:
                cout << "Cambiando propietario o grupo..." << endl;
                system("../Scripts/./changeOwner.sh");
                break;
            case 9:
                cout << "Actualizando paquetes..." << endl;
                system("../Scripts/./updatePackages.sh");
                break;
            case 10:
                cout << "Saliendo del programa...." << endl;
                break;
            default:
                cout << "Ingresa una opcion del menu valida" << endl;
                break;
        }

    } while (userSelection != 10);

    return 0;
}
