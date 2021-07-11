import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:beeneatapp/src/home_page.dart';
import 'package:beeneatapp/utils/fire_auth.dart';
import 'package:beeneatapp/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

final proyectosReferences =
    FirebaseDatabase.instance.reference().child('Proyecto');

class _NewTaskState extends State<NewTask> {
  final _registerFormKey = GlobalKey<FormState>();

  final _NombreProyectoController = TextEditingController();
  final _LiderproyectoController = TextEditingController();
  final _FechInicioController = TextEditingController();
  final _FechFinController = TextEditingController();
  final _DescripcionController = TextEditingController();

  final _focusNombreProyecto = FocusNode();
  final _focusLiderproyecto = FocusNode();
  final _focusFechInicio = FocusNode();
  final _focusFechFin = FocusNode();
  final _focusDescripcion = FocusNode();

  bool _isProcessing = false;
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNombreProyecto.unfocus();
        _focusLiderproyecto.unfocus();
        _focusFechInicio.unfocus();
        _focusFechFin.unfocus();
        _focusDescripcion.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset("assets/images/Logo1.png")),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: myBoxDecoration(),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Form(
                                  key: _registerFormKey,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 7.0),
                                        child: Text(
                                          'Nueva Tarea',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Nombre de la tarea",
                                          errorBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Equipo asignado",
                                          errorBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Complejidad ",
                                          errorBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Container(
                                        margin: EdgeInsets.all(12),
                                        height: null,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "Descripcion",
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(8),
                                            errorBorder: UnderlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
