import 'package:beeneatapp/src/infoproyecto.dart';
import 'package:beeneatapp/src/newtask.dart';
import 'package:flutter/material.dart';

class InfoProyect extends StatefulWidget {
  @override
  _InfoProyectState createState() => _InfoProyectState();
}

class _InfoProyectState extends State<InfoProyect> {
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
              InfoProyect();
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
                builder: (context) => NewTask(),
              ),
              ModalRoute.withName(''));
        },
      ),
    );
  }

  Card miCardDesign(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 0.0, 50.0,50.0),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Descripcion del proyecto:  ',
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
