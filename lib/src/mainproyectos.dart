import 'package:beeneatapp/src/newproyectos.dart';
import 'package:beeneatapp/src/proyectos.dart';
import 'package:flutter/material.dart';

class mainproyecto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.all(7),
          child: Center(
            child: Column(
              
              
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Image.asset("assets/images/Logo2.png"),
                ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        miCardDesign(context),
                      ],
                    ),
                  )
                ]),
          ),
        ));
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
                  'Proyecto:  ',
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
                  'Descripcion del proyecto:  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  textScaleFactor: 1,
                ),
              ]
              ),            
            ],
          ),
        ),
      ),
    );
  }
}