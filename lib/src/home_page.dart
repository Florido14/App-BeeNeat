import 'package:beeneatapp/src/mainproyectos.dart';
import 'package:beeneatapp/src/newproyectos.dart';
import 'package:beeneatapp/src/proyectos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
                        miCard(context),
                        miCardDesign(context),
                      ],
                    ),
                  )
                ]),
          ),
        ));
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
                    builder: (context) => mainProyecto(),
                  ),
                  ModalRoute.withName('/mainproyecto'),
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
