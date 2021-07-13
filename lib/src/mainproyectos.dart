import 'package:beeneatapp/Models/proyectos.dart';
import 'package:beeneatapp/src/infoproyecto.dart';
import 'package:beeneatapp/src/newproyectos.dart';
import 'package:beeneatapp/src/proyectos.dart';
import 'package:beeneatapp/src/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final proyectosReferences =
    FirebaseDatabase.instance.reference().child('Proyecto');
List<Proyectos> lstProyectos = [];

class mainProyecto extends StatefulWidget {
  const mainProyecto({Key? key}) : super(key: key);

  @override
  _mainProyectoState createState() => _mainProyectoState();
}

class _mainProyectoState extends State<mainProyecto> {
  @override
  void initState() {
    super.initState();
    getProyectos();
  }

  void getProyectos() {
    lstProyectos = [];
    proyectosReferences.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> getMapPrductos = snapshot.value;
      getMapPrductos.forEach((key, value) {
        Map<dynamic, dynamic> f = value;
        Proyectos proyectosExistentes = Proyectos("", "", "", "", "", "");
        var s = f["Precio"];
        proyectosExistentes.idProyecto = key;
        proyectosExistentes.nombreProyecto = f["NombreProyecto"];
        proyectosExistentes.lider = f["Lider"];
        setState(() {
          lstProyectos.add(proyectosExistentes);
        });
      });
    });
  }

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
                    padding: const EdgeInsets.only(bottom: 40.0, top: 30.0),
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              ModalRoute.withName('/Landing'));
                        },
                        child: Image.asset("assets/images/Logo2.png")),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: lstProyectos.length,
                        itemBuilder: (context, index) {
                          return miCardDesign(
                              context,
                              "${lstProyectos[index].idProyecto}",
                              "${lstProyectos[index].nombreProyecto}",
                              "${lstProyectos[index].lider}");
                        }),
                  )
                ]),
          ),
        ));
  }

  Card miCardDesign(
      BuildContext context, String idProyecto, String nombre, String lider) {
    return Card(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ExistProyect(idProyecto),
            ),
            ModalRoute.withName('/existProyect'),
          );
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 0.0, 50.0, 50.0),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Proyecto: $nombre ',
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
                    'Lider: $lider',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    textScaleFactor: 1,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
