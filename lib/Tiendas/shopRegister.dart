import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ShopRegister extends StatefulWidget {
  @override
  ShopRegisterApp createState() => ShopRegisterApp();
}

class ShopRegisterApp extends State<ShopRegister> {
  @override
  TextEditingController nombreTienda = TextEditingController();
  TextEditingController rutaImagen = TextEditingController();
  TextEditingController descrTienda = TextEditingController();
  TextEditingController website = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registrar() async {
    try {
      //await Firebase.initializeApp();
      //return await FirebaseFirestore.instance
      await firebase.collection("Tiendas").doc().set({
        "nombreTienda": nombreTienda.text,
        "ruta": rutaImagen.text,
        "descripción": descrTienda.text,
        "website": website.text
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Registro Tiendas"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: nombreTienda,
                decoration: InputDecoration(
                  labelText: "Nombre Tienda",
                  hintText: "Digite Nombre de la Tienda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: rutaImagen,
                decoration: InputDecoration(
                  labelText: "Ruta de la Imagen",
                  hintText: "Digite ruta de la imagen",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: descrTienda,
                decoration: InputDecoration(
                  labelText: "Descripción Tienda",
                  hintText: "Digite descripción de la Tienda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: website,
                decoration: InputDecoration(
                  labelText: "pagina web",
                  hintText: "Digite pagina web de la Tienda",
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
                  registrar();
                  nombreTienda.clear();
                  rutaImagen.clear();
                  descrTienda.clear();
                  website.clear();
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
