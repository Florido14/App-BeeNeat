import 'package:beeneatapp/src/infoproyecto.dart';
import 'package:beeneatapp/src/newtask.dart';
import 'package:flutter/material.dart';

class ExistProyect extends StatefulWidget {
  @override
  _ExistProyectState createState() => _ExistProyectState();
}

class _ExistProyectState extends State<ExistProyect> {
  String idProyecto = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Proyecto: '),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              InfoProyect(idProyecto);
            },
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  miCardDesign(context),
                ],
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => NewTask(idProyecto),
              ),
              ModalRoute.withName(''));
        },
      ),
    );
  }

  Card miCardDesign(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 0.0, 50.0, 50.0),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Tarea No. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textScaleFactor: 1,
                ),
              ]),
              Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Descripcion de la tarea:  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textScaleFactor: 1,
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Equipo asignado:   ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    textScaleFactor: 1,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Complejidad:   ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textScaleFactor: 1,
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
