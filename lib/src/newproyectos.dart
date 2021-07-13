import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:beeneatapp/src/home_page.dart';
import 'package:beeneatapp/utils/fire_auth.dart';
import 'package:beeneatapp/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class NewProyecto extends StatefulWidget {
  @override
  _NewProyectoState createState() => _NewProyectoState();
}

final proyectosReferences =
    FirebaseDatabase.instance.reference().child('Proyecto');

class _NewProyectoState extends State<NewProyecto> {
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Fondo_New.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
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
                                          'Nuevo Proyecto',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _NombreProyectoController,
                                        focusNode: _focusNombreProyecto,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Nombre del Proyecto",
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
                                        controller: _LiderproyectoController,
                                        focusNode: _focusLiderproyecto,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Lider de Proyecto",
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
                                        keyboardType: TextInputType.datetime,
                                        controller: _FechInicioController,
                                        focusNode: _focusFechInicio,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Fecha inicio ",
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
                                        keyboardType: TextInputType.datetime,
                                        controller: _FechFinController,
                                        focusNode: _focusFechFin,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Fecha Fin",
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
                                        controller: _DescripcionController,
                                        focusNode: _focusDescripcion,
                                        // obscureText: true,
                                        validator: (value) =>
                                            Validator.validatePassword(
                                          password: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Descripcion",
                                          errorBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: BorderSide(
                                              color: Colors.red,
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

                                                  proyectosReferences
                                                      .push()
                                                      .set({
                                                    'NombreProyecto':
                                                        _NombreProyectoController
                                                            .text,
                                                    'Lider':
                                                        _LiderproyectoController
                                                            .text,
                                                    'FechaInicio':
                                                        _FechInicioController
                                                            .text,
                                                    'FechaFin':
                                                        _FechFinController.text,
                                                    'Descripcion':
                                                        _DescripcionController
                                                            .text
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
                                                  'Crear Proyecto',
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
