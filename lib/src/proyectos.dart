import 'package:beeneatapp/Models/proyectos.dart';
import 'package:beeneatapp/Models/tareas.dart';
import 'package:beeneatapp/src/home_page.dart';
import 'package:beeneatapp/src/infoproyecto.dart';
import 'package:beeneatapp/src/newtask.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final proyectosReferences =
    FirebaseDatabase.instance.reference().child('Proyecto');

final tareasReference = FirebaseDatabase.instance.reference().child('Tareas');
List<Tareas> lstTareas = [];

class ExistProyect extends StatefulWidget {
  String idKey;
  ExistProyect(this.idKey);
  @override
  _ExistProyectState createState() {
    return _ExistProyectState(idKey);
  }
}

class _ExistProyectState extends State<ExistProyect> {
  String idKey;
  _ExistProyectState(this.idKey);

  Proyectos proyecto = Proyectos("", "", "", "", "", "");

  @override
  void initState() {
    super.initState();
    getProyectos();
    getTareas();
  }

  void getProyectos() {
    proyecto = Proyectos("", "", "", "", "", "");
    proyectosReferences.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> getMapPrductos = snapshot.value;
      getMapPrductos.forEach((key, value) {
        Map<dynamic, dynamic> f = value;
        var idProyecto = key;
        if (idProyecto == idKey) {
          setState(() {
            proyecto.idProyecto = key;
            proyecto.nombreProyecto = f["NombreProyecto"];
            proyecto.lider = f["Lider"];
            proyecto.descripcion = f['Descripcion'];
            proyecto.fechaInicio = f['FechaInicio'];
            proyecto.fechaFin = f['FechaFin'];
          });
        }
      });
    });
  }

  void getTareas() {
    lstTareas = [];
    tareasReference.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> getMapPrductos = snapshot.value;
      getMapPrductos.forEach((key, value) {
        Map<dynamic, dynamic> f = value;
        Tareas tareasExistente = Tareas("", "", "", "", "", "");
        var idProyecto = f['IdProyecto'];

        if (idProyecto == idKey) {
          tareasExistente.idProyecto = key;
          tareasExistente.nombreTarea = f["NombreTarea"];
          tareasExistente.lider = f["Lider"];
          tareasExistente.descripcion = f['Descripcion'];
          tareasExistente.complejidad = f['Complejidad'];
          tareasExistente.idProyecto = f['IdProyecto'];
          setState(() {
            lstTareas.add(tareasExistente);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Proyecto: ${proyecto.nombreProyecto} '),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                ModalRoute.withName('/Landing'));
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => InfoProyect(idKey),
                ),
                ModalRoute.withName('/infoProyect'),
              );
            },
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: ListView.builder(
                  itemCount: lstTareas.length,
                  itemBuilder: (context, index) {
                    return miCardDesign(
                        context,
                        "${lstTareas[index].nombreTarea}",
                        "${lstTareas[index].complejidad}",
                        "${lstTareas[index].descripcion}");
                  }),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => NewTask(idKey),
              ),
              ModalRoute.withName(''));
        },
      ),
    );
  }

  Card miCardDesign(BuildContext context, String nombre, String complejidad,
      String descripcion) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 0.0, 50.0, 50.0),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Nombre: $nombre',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textScaleFactor: 1,
                ),

                Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black),

                Text(
                  'Descripcion de la tarea: $descripcion',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textScaleFactor: 1,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Equipo asignado:   ',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(fontSize: 15, color: Colors.black),
                //       textScaleFactor: 1,
                //     ),
                //   ],
                // ),

                Text(
                  'Complejidad: $complejidad',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textScaleFactor: 1,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
