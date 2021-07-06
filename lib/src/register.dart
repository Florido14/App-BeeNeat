import 'package:beeneatapp/src/Login.dart';
import 'package:beeneatapp/src/home_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:beeneatapp/src/profile_page.dart';
import 'package:beeneatapp/utils/fire_auth.dart';
import 'package:beeneatapp/utils/validator.dart';
import 'package:beeneatapp/src/home_page.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

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
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fondologin.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding( padding: const EdgeInsets.all(60.0),
                        child: Image.asset("assets/images/Logo1.png")
                      ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: myBoxDecoration(),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
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
                                            const EdgeInsets.only(bottom: 30.0),
                                        child: Text(
                                          'Crea una cuenta',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25, color: Colors.black),
                                          textScaleFactor: 1,
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _nameTextController,
                                        focusNode: _focusName,
                                        validator: (value) =>
                                            Validator.validateName(
                                          name: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Nombre",
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
                                        controller: _emailTextController,
                                        focusNode: _focusEmail,
                                        validator: (value) =>
                                            Validator.validateEmail(
                                          email: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Correo",
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
                                        controller: _passwordTextController,
                                        focusNode: _focusPassword,
                                        obscureText: true,
                                        validator: (value) =>
                                            Validator.validatePassword(
                                          password: value,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Contraseña",
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
                                      _isProcessing
                                          ? CircularProgressIndicator()
                                          : Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      setState(() {
                                                        _isProcessing = true;
                                                      });

                                                      if (_registerFormKey
                                                          .currentState!
                                                          .validate()) {
                                                        User? user = await FireAuth
                                                            .registerUsingEmailPassword(
                                                          name: _nameTextController
                                                              .text,
                                                          email:
                                                              _emailTextController
                                                                  .text,
                                                          password:
                                                              _passwordTextController
                                                                  .text,
                                                        );

                                                        setState(() {
                                                          _isProcessing = false;
                                                        });

                                                        if (user != null) {
                                                          Navigator.of(context)
                                                              .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  HomePage(
                                                                      ),
                                                            ),
                                                            ModalRoute.withName(
                                                                '/'),
                                                          );
                                                        }
                                                      }
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
                                                      'Crear cuenta',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 30),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text('¿Ya tienes una cuenta?'),
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
