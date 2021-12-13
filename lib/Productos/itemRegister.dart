import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ItemRegister extends StatefulWidget {
  final String ID_TIENDA;
  ItemRegister(this.ID_TIENDA);


  @override
  ItemRegisterApp createState() => ItemRegisterApp();
}

class ItemRegisterApp extends State<ItemRegister> {
  @override
  TextEditingController nombre = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController descripcion = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  registrarProducto() async {
    try {
      //await Firebase.initializeApp();
      //return await FirebaseFirestore.instance
      await firebase.collection("Productos")
          .doc()
          .set({
        "Nombre": nombre.text,
        "Precio": precio.text,
        "Descripcion": descripcion.text,
        "TiendaID":widget.ID_TIENDA,

        "Estado": true
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Productos"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: nombre,
                decoration: InputDecoration(
                  labelText: "Nombre del Producto",
                  hintText: "Digite un Nombre del Producto",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: precio,
                decoration: InputDecoration(
                  labelText: "Precio",
                  hintText: "Digite un Precio",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
                controller: descripcion,
                decoration: InputDecoration(
                  labelText: "Descripcion",
                  hintText: "Digite una Descripción",
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
                  registrarProducto();
                  nombre.clear();
                  precio.clear();
                  descripcion.clear();

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