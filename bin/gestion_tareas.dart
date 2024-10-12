import 'package:gestion_tareas/gestion_tareas.dart' as gestion_tareas;
import 'dart:io';

void main(List<String> arguments) {
  print('       ¡Bienvenido!! ');
  var listaTareas = [];
  var rightRabbit = '           (|(|\n          (.. )\n          c(")(")';

  void crearTarea() {
    print('Escribe el nombre de la tarea: ');
    String? nombreTarea = stdin.readLineSync();

    if (nombreTarea != null) {
      listaTareas.add(
        {'nombre': nombreTarea, 'estado': false, 'completed': '( )'}
      );
      print('La tarea se creo correctamente :)');
    } else {
      print('Escribe bien UnU');
    }
  }

  void listarTareas() {
    for (var i = 0; i < listaTareas.length; i++) {
      print('${i+1}. ${listaTareas[i]['completed']} ${listaTareas[i]['nombre']}');
    }
  }

  void completarTarea() {
    listarTareas();
    print('Elige la tarea que quieres comletar: ');
    String? uInput = stdin.readLineSync();
    int indice = int.parse(uInput ?? '0');

    if (indice > 0 && indice <= listaTareas.length) {
      listaTareas[indice - 1]['estado'] = true;
      listaTareas[indice - 1]['completed'] = '(✓)';
      print('La tarea se ha actualizado correctamente :)');
    } else {
      print('No se puede actualizar la tarea ._.');
    }
  }

  bool eleccionContinuar() {
    print('¿Deseas continuar? (s/n)');

    String? uInput = stdin.readLineSync();
    
    if(uInput == 's' || uInput == 'S') {
      return true;
    } else if (uInput == 'n' || uInput == 'N') {
      return false;
    } else {
      return eleccionContinuar();
    }
  }

  bool continuar = true;
  while (continuar) {
    print('Elige una opción: ');
    print('1. Crear una tarea');
    print('2. Ver tareas');
    print('3. Completar tarea');
    print('0. Para salir');

    print(rightRabbit);

    String? uInput = stdin.readLineSync();
    int  opcion = int.parse(uInput ?? '0');

    print('------------------------------------');

    if(opcion == 0) {
      continuar = false;
      break;
    } else if (opcion == 1) {
      crearTarea();
    } else if (opcion == 2) {
      print('Tus tareas ^-^:');
      listarTareas();
    } else if (opcion == 3) {
      completarTarea();
    } else {
      print('Elige una opción válida!!!! x_X');
    }

    print('------------------------------------');
    continuar = eleccionContinuar();
    print('------------------------------------');
  }
  print('Hasta la próxima...');
}
