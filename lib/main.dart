import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:projecto_grupo6/Usuarios/gestionUsuarios.dart';
import "buscar.dart";
import 'Tiendas/shop.dart';
import 'Tiendas/shopRegister.dart';
import 'Usuarios/gestionUsuarios.dart';
import 'Usuarios/registroUser.dart';
import 'Tiendas/gestionTiendas.dart';

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
  TextEditingController busqueda=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bienvenidos Grupo 06",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home app grupo 06"),
          actions: [
            FloatingActionButton(
              onPressed: () {
               // Navigator.push(
                 //   context, MaterialPageRoute(builder: (_) => ItemRegister(tiendaId)));
              },

              tooltip: "Carrito",
              child:const Icon(Icons.shopping_cart),
             // child: Text("Añadir"),
              backgroundColor: Colors.teal,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
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
                    controller: busqueda,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "busqueda",
                          hintText: "palabra clave de la busqueda"))
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    print("presionado");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Buscar(busqueda.text)));
                  },
                  child: Text("Buscar"),
                ),
              ),


              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GestionUsuario()));
                  },
                  child: Text("Gestion de Usuario"),
                ),
              ),Padding(
                padding:
                EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GestionTiendas()));
                  },
                  child: Text("Gestion de Tienda"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
