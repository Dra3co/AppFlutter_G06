import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BajaUsuario extends StatefulWidget {
  @override
  BajaUsuarioApp createState() => BajaUsuarioApp();
}

class BajaUsuarioApp extends State<BajaUsuario> {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenaA = TextEditingController();
  TextEditingController contrasenaN = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  validarBaja() async {
    try {
      CollectionReference ref =
      FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get("correo") == correo.text) {
            if (cursor.get("contraseña") == contrasenaA.text) {
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
            }
          }
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
        title: Text("Inactivar Usuario"),
      ),
    );
  }
}
