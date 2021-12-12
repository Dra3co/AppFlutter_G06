import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class RegistroUsuario extends StatefulWidget {
  @override
  RegistroUsuarioApp createState() => RegistroUsuarioApp();
}

class RegistroUsuarioApp extends State<RegistroUsuario> {
  @override
  TextEditingController nombreUsuario=TextEditingController();
  TextEditingController correo=TextEditingController();
  TextEditingController telefono=TextEditingController();
  TextEditingController contrasena=TextEditingController();
  final firebase=FirebaseFirestore.instance;

  registrar() async{
    try{
      //await Firebase.initializeApp();
      //return await FirebaseFirestore.instance
      await firebase
          .collection("Usuarios")
          .doc()
          .set({
        "nombreUsuario":nombreUsuario.text,
        "correo":correo.text,
        "telefono":telefono.text,
        "contraseña":contrasena.text
      });
    }
    catch(e){
      print(e);
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Usuario"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: nombreUsuario,
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
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  labelText: "Correo Electronico",
                  hintText:"Digite un Correo Electronico",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: TextField(
                controller: telefono,
                decoration: InputDecoration(
                  labelText: "Numero Telefonico",
                  hintText:"Digite Numero Telefonico",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: TextField(
                obscureText: true,
                controller: contrasena,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  hintText:"Digite una Contraseña",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: ElevatedButton(
                onPressed: (){
                  registrar();
                  nombreUsuario.clear();
                  correo.clear();
                  telefono.clear();
                  contrasena.clear();

                },
                child: Text("Registrar"),
              ),

            ),
          ],
        ),
      ),
    );
  }
}