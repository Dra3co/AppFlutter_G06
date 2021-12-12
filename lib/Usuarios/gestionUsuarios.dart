import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projecto_grupo6/Usuarios/bajaUsuario.dart';
import 'package:projecto_grupo6/Usuarios/cambioPass.dart';
import 'package:projecto_grupo6/Usuarios/login.dart';
import 'registroUser.dart';
import 'login.dart';
import 'cambioPass.dart';
import 'bajaUsuario.dart';

class GestionUsuario extends StatefulWidget {
  @override
  GestionUsuarioApp createState() => GestionUsuarioApp();
}

class GestionUsuarioApp extends State<GestionUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion Usuario"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistroUsuario()));
                },
                child: Text("Registro Usuario"),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text("Login"),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {},
                child: Text("Modificar Usuario"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CambioPass()));
                },
                child: Text("Cambio de Contraseña"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {},
                child: Text("Modificar Usuario"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                 mensaje("Inactivar Usuario", "¿Desea inactivar el Usuario?");
                  // Navigator.push(context,
                     // MaterialPageRoute(builder: (_) => BajaUsuario()));
                },
                child: Text("Dar de Baja"),
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
              Padding(
                padding: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 0),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Correo',
                    hintText: 'Digite el correo',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 0),
                child: TextField(
                  // controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Contraseña',
                    hintText: 'Digite Contraseña',
                  ),
                ),
              ),

              RaisedButton(
                onPressed: () {

                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                Text("Cancelar", style: TextStyle(color: Colors.blueGrey)),
              ),
            ],
          );
        });
  }
}
