import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:projecto_grupo6/gestionUsuarios.dart';
import "buscar.dart";
import "shop.dart";
import 'shopRegister.dart';
import 'gestionUsuarios.dart';
import 'registroUser.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

@override
class HomeStart extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bienvenidos Grupo 06",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home app grupo 06"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset("image/logo.png"),
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "busqueda",
                        hintText: "palabra clave de la busqueda")
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  print("presionado");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => buscar()));
                },
                child: Text("Buscar"),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Shop()));
                  },
                  child: Text("Listado de Tiendas"),
                ),

            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ShopRegister()));
                },
                child: Text("Registro de la Tienda"),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => GestionUsuario()));
                },
                child: Text("Gestion de Usuario"),
              ),

            ),
          ],
          ),
        ),
      ),
    );
  }
}
