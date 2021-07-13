import 'package:beeneatapp/src/newproyectos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beeneatapp/src/mainproyectos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuTipoUno extends StatefulWidget {
  @override
  _MenuTipoUnoState createState() => _MenuTipoUnoState();
}

class _MenuTipoUnoState extends State<MenuTipoUno> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.red,
            Colors.redAccent,
          ])),
          child: Container(
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10,
                  child: Image.asset(
                    'assets/images/Logo2.png',
                    width: 100,
                    height: 100,
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          title: Text("Proyectos Actuales"),
          leading: Icon(Icons.miscellaneous_services),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => mainProyecto(),
              ),
              ModalRoute.withName('/mainproyecto'),
            );
          },
        ),
        ListTile(
          title: Text("Nuevos Proyectos"),
          leading: Icon(Icons.account_circle_sharp),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => NewProyecto(),
              ),
              ModalRoute.withName('/newProyecto'),
            );
          },
        )
      ],
    );
  }
}
