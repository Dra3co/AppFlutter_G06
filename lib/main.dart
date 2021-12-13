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
  TextEditingController busqueda = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bienvenidos a Tiendas Bachué",
      home: Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Tiendas Barrio Bachué"),

          actions: [
            FloatingActionButton(
              onPressed: () {},

              tooltip: "Carrito",
              child: const Icon(Icons.shopping_cart),
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
              ),Container(

                padding: const EdgeInsets.all(1),
                child: Row(

                  children: [
                    Expanded(
                      /*1*/
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*2*/
                          Container(
                            padding: const EdgeInsets.only(left: 20,right: 0),
                            child: TextField(
                                controller: busqueda,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "busqueda",
                                    hintText: "palabra clave de la busqueda")),
                          ),





                        ],

                      ),
                    ),Expanded(child: Container(
                      padding: const EdgeInsets.only(left:0, top: 0, right: 10, bottom: 0),
                      child: FloatingActionButton(
                        //style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),

                        onPressed: () {
                          print("presionado");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Buscar(busqueda.text)));
                        },
                        child:const Icon(Icons.search),
                        backgroundColor: Colors.lightBlueAccent,
                        tooltip: "Buscar",

                      ),
                    ),)
                  ],
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
              ),
              Padding(
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
