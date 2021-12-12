import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CambioPass extends StatefulWidget {
  @override
  CambiopassApp createState() => CambiopassApp();
}

class CambiopassApp extends State<CambioPass> {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenaA = TextEditingController();
  TextEditingController contrasenaN = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  validarPass() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        //print(usuario.docs.length);
        int flag = 0;
        for (var cursor in usuario.docs) {
          //print(cursor.get("correo"));
          if (cursor.get("correo") == correo.text) {
            //print(cursor.get("contraseña"));
            if (cursor.get("contraseña") == contrasenaA.text) {
              // mensaje("Correcto","usuario correcto");
              //print(cursor.get("nombreUsuario"));
              flag = 1;
              print(cursor.id);
              try {
                await firebase.collection("Usuarios").doc(cursor.id)
                  ..set({
                    "nombreUsuario": cursor.get("nombreUsuario"),
                    "correo": cursor.get("correo"),
                    "telefono": cursor.get("telefono"),
                    "contraseña": contrasenaN.text,
                    "estado": true
                  });
              } catch (e) {
                print(e);
              }

              //Navigator.push(
              //  context, MaterialPageRoute(builder: (_) => buscar()));
            }
          }
        }
        if (flag == 0) {
          //mensaje("No Encontrado","no se encontro el usuario");
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
        title: Text("Cambio Contraseña"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("image/contraseña.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Correo",
                  hintText: "Ingrese Correo",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: contrasenaA,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Contraseña Actual",
                  hintText: "Ingrese Contraseña Actual",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: contrasenaN,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Nueva Contraseña",
                  hintText: "Ingrese Nueva Contraseña",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  validarPass();
                },
                child: Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
