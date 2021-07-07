import 'package:flutter/material.dart';

class ExistProyect extends StatefulWidget {
  @override
  _ExistProyectState createState() => _ExistProyectState();
}

class _ExistProyectState extends State<ExistProyect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
            title: Text(
          'BeeNeat',
          textAlign: TextAlign.center,
        )),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: <Widget>[
                  miCardDesign(context),
                ],
              )),
            ]));
  }

  Card miCardDesign(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: Column(
        children: [
          Row(
            children: [Text("Nombre del Pryecto : PIA")],
          ),
          Row(
            children: [Text("Lider del Proyecto: Jorge")],
          ),
          Row(
            children: [Text("Fecha inicio: 06/07/2021")],
          ),
          Row(
            children: [Text("Fecha fin: 12/07/2021")],
          )
        ],
      ),
    );
  }
}
