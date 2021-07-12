import 'package:firebase_database/firebase_database.dart';

class Proyectos {
  String? idProyecto = "";
  String nombreProyecto = "";
  String lider = "";
  String fechaInicio = "";
  String fechaFin = "";
  String descripcion = "";
  Proyectos(this.idProyecto, this.nombreProyecto, this.lider, this.descripcion,
      this.fechaFin, this.fechaInicio);

  Proyectos.fromSnapshot(DataSnapshot snapshot) {
    idProyecto = snapshot.key;
    nombreProyecto = snapshot.value['NombreProyecto'];
    lider = snapshot.value['Lider'];
    descripcion = snapshot.value['Descripcion'];
    fechaInicio = snapshot.value['FechaInicio'];
    fechaFin = snapshot.value['FechaFin'];
  }
}
