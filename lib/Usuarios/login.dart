import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../buscar.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          print(cursor.get("correo"));
          if (cursor.get("correo") == correo.text) {
            print(cursor.get("contraseña"));
            if (cursor.get("contraseña") == contrasena.text) {
              mensaje("Correcto", "usuario correcto");
              print(cursor.get("nombreUsuario"));
              flag = 1;
              //Navigator.push(
                  //context, MaterialPageRoute(builder: (_) => Buscar()));
            }
          }
        }
        if (flag == 0) {
          mensaje("No Encontrado", "no se encontro el usuario");
        }
      } else {
        print("no hay elementos en la colección");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingreso de clientes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("image/login.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "correo",
                  hintText: "Digite el Correo",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: contrasena,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "contraseña",
                  hintText: "Digite la Contraseña",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  validarDatos();
                  //correo.clear();
                  //contrasena.clear();
                },
                child: Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
