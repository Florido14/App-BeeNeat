import 'package:beeneatapp/Models/proyectos.dart';
import 'package:beeneatapp/src/home_page.dart';
import 'package:beeneatapp/src/infoproyecto.dart';
import 'package:beeneatapp/src/newtask.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final proyectosReferences =
    FirebaseDatabase.instance.reference().child('Proyecto');

class InfoProyect extends StatefulWidget {
  String idKey;
  InfoProyect(this.idKey);
  @override
  _InfoProyectState createState() {
    return _InfoProyectState(idKey);
  }
}

class _InfoProyectState extends State<InfoProyect> {
  String idKey;
  _InfoProyectState(this.idKey);
  Proyectos proyecto = Proyectos("", "", "", "", "", "");
  @override
  void initState() {
    super.initState();
    getProyectos();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${proyecto.nombreProyecto}'),
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
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.info,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       InfoProyect(idKey);
        //     },
        //   )
        // ],
      ),
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.teal.shade600, Colors.teal.shade100])),
          child:
            Expanded(
              child: ListView(
                children: <Widget>[
                  miCardDesign(context),
                ],
              ),
            ),
          ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).pushAndRemoveUntil(
      //         MaterialPageRoute(
      //           builder: (context) => NewTask(idKey),
      //         ),
      //         ModalRoute.withName(''));
      //   },
      // ),
    );
  }

  Card miCardDesign(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Equipo: ${proyecto.lider}  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textScaleFactor: 1,
                ),
                Text(
                  'Descripcion del proyecto: ${proyecto.descripcion}  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textScaleFactor: 1,
                ),
                Text(
                  'Fecha Inicio: ${proyecto.fechaInicio}  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textScaleFactor: 1,
                ),
                Text(
                  'Fecha Fin: ${proyecto.fechaFin}  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
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
