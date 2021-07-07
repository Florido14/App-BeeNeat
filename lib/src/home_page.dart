import 'package:beeneatapp/src/newproyectos.dart';
import 'package:beeneatapp/src/proyectos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                  miCard(context),
                  miCardDesign(context),
                ],
              )),
            ]));
  }

  Card miCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: Stack(
        children: [
          Ink.image(
            image: AssetImage('assets/images/Proyectos_A.png'),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => ExistProyect(),
                  ),
                  ModalRoute.withName('/ExistProyect'),
                );
              },
            ),
            height: 200,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  Card miCardDesign(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: Stack(
        children: [
          Ink.image(
            image: AssetImage('assets/images/Proyectos_B.png'),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => NewProyecto(),
                  ),
                  ModalRoute.withName('/newProyecto'),
                );
              },
            ),
            height: 200,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
