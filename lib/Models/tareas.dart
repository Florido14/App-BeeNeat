import 'package:firebase_database/firebase_database.dart';

class Tareas {
  String? idTarea = "";
  String nombreTarea = "";
  String lider = "";
  String idProyecto = "";
  String complejidad = "";
  String descripcion = "";
  Tareas(this.idTarea, this.nombreTarea, this.lider, this.descripcion,
      this.complejidad, this.idProyecto);

  Tareas.fromSnapshot(DataSnapshot snapshot) {
    idTarea = snapshot.key;
    nombreTarea = snapshot.value['NombreTarea'];
    lider = snapshot.value['Lider'];
    descripcion = snapshot.value['Descripcion'];
    idProyecto = snapshot.value['IdProyecto'];
    complejidad = snapshot.value['Complejidad'];
  }
}
