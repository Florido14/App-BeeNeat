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
  String idKey;
  NewTask(this.idKey);
  @override
  _NewTaskState createState() {
    return _NewTaskState(idKey);
  }
}

final tareasReference = FirebaseDatabase.instance.reference().child('Tareas');

class _NewTaskState extends State<NewTask> {
  String idKey;
  _NewTaskState(this.idKey);
  final _registerFormKey = GlobalKey<FormState>();

  final _NombreTareaController = TextEditingController();
  final _EquipoController = TextEditingController();
  final _ComplejidadController = TextEditingController();
  final _DescripcionController = TextEditingController();

  final _focusNombreTarea = FocusNode();
  final _focusEquipo = FocusNode();
  final _focusComplejidad = FocusNode();
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
        _focusNombreTarea.unfocus();
        _focusEquipo.unfocus();
        _focusComplejidad.unfocus();
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
                        child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                  ModalRoute.withName('/Landing'));
                            },
                            child: Image.asset("assets/images/Logo1.png"))),
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
                                        controller: _NombreTareaController,
                                        focusNode: _focusNombreTarea,
                                        // obscureText: true,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
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
                                        controller: _EquipoController,
                                        focusNode: _focusEquipo,
                                        // obscureText: true,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
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
                                        controller: _ComplejidadController,
                                        focusNode: _focusComplejidad,
                                        // obscureText: true,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
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
                                          controller: _DescripcionController,
                                          focusNode: _focusDescripcion,
                                          // obscureText: true,
                                          validator: (value) =>
                                              Validator.validateName(
                                            name: value,
                                          ),
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
                                      SizedBox(height: 32.0),
                                      if (_isProcessing)
                                        CircularProgressIndicator()
                                      else
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    _isProcessing = true;
                                                  });

                                                  setState(() {
                                                    _isProcessing = false;
                                                  });

                                                  tareasReference.push().set({
                                                    'NombreTarea':
                                                        _NombreTareaController
                                                            .text,
                                                    'Lider':
                                                        _EquipoController.text,
                                                    'Complejidad':
                                                        _ComplejidadController
                                                            .text,
                                                    'Descripcion':
                                                        _DescripcionController
                                                            .text,
                                                    'IdProyecto': idKey
                                                  }).then((_) {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage(),
                                                      ),
                                                      ModalRoute.withName('/'),
                                                    );
                                                  }).catchError((e) {
                                                    print(e);
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    side: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    padding:
                                                        EdgeInsets.all(20)),
                                                child: Text(
                                                  'Crear Tarea',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
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
