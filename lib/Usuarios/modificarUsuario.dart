import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModificarUsuario extends StatefulWidget {
  @override
  ModificarUsuarioApp createState() => ModificarUsuarioApp();
}

class ModificarUsuarioApp extends State<ModificarUsuario> {
  TextEditingController correo = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController direccion = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  String email = "";
  String idDoc = "";
  String pass = "";
  bool state = true;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get("correo") == correo.text) {
            nombre.text = cursor.get("nombreUsuario");
            telefono.text = cursor.get("telefono");
            direccion.text = cursor.get("dirección");
            this.idDoc = cursor.id;
            this.email = cursor.get("correo");
            this.pass = cursor.get("contraseña");
          }
        }
      } else {
        print("no hay elementos en la colección");
      }
    } catch (e) {
      print(e);
    }
  }

  modificarDatos() async {
    try {
      await firebase.collection("Usuarios").doc(idDoc).set({
        "nombreUsuario": nombre.text,
        "correo": this.email,
        "telefono": telefono.text,
        "dirección": direccion.text,
        "contraseña": pass,
        "estado": state
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Usuario"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  labelText: "Correo Electronico",
                  hintText: "Digite un Correo Electronico",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  validarDatos();
                },
                child: Text("Buscar"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                  labelText: "Nombre de usuario",
                  hintText: "Digite un Nombre de Usuario",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                  labelText: "Numero Telefonico",
                  hintText: "Digite Numero Telefonico",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: direccion,
                decoration: InputDecoration(
                  labelText: "Dirección",
                  hintText: "Digite una Dirección",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  modificarDatos();
                  nombre.clear();
                  direccion.clear();
                  telefono.clear();
                  correo.clear();
                },
                child: Text("Modificar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
