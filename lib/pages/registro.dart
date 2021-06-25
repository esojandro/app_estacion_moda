import 'package:app_estacion_moda/controllers/firestore_service.dart';

import 'package:app_estacion_moda/controllers/usuario_controller.dart';

import 'package:app_estacion_moda/pages/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_estacion_moda/controllers/registro.controller.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/src/rendering/object.dart';

class RegistroPage extends StatelessWidget {
  final controller = Get.put(RegistroController());
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final firestoreService = FirestoreService();
    final userFirebase = Provider.of<UsuarioController>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Registro",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.pink.shade300,
          actions: [],
        ),
        body: GetBuilder<RegistroController>(builder: (_) {
          return Form(
            key: controller.formKey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                // child: Form(
                // key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Usuario'),
                      onChanged: (value) {
                        userFirebase.changeName(value);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese sus datos';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      onChanged: (value) {
                        userFirebase.changeCorreo(value);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese sus datos';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Por ingrese sus datos';
                        }
                        if (value.length < 5 || value.length > 9) {
                          return 'No es valido';
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      onChanged: (value) {
                        userFirebase.changeContrasena(value);
                      },
                      obscureText: true,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.blue.shade600,
                        textColor: Colors.white,
                        child: Text("Registrarse"),
                        onPressed: () async {
                          if (_keyForm.currentState.validate()) {
                            print("Registro exitoso!!");
                            _.register(controller.emailController.text,
                                controller.passwordController.text);
                            userFirebase.saveUsuario();
                          } else {
                            print(
                                "Ha ocurrido un error, vuelva a registrar sus datos");
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 25.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage())),
                                //dispose()
                              },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink.shade300),
                          child: Text("Login")),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(controller.success == null
                          ? ''
                          : (controller.success
                              ? 'SuccessFully registered' + controller.userEmail
                              : 'El registro fallo')),
                    ),
                  ],
                ),
                //),
              ),
            ),
          );
        }),
      ),
    );
  }
}
