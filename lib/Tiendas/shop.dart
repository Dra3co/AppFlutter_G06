import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projecto_grupo6/Tiendas/shopOne.dart';
import 'package:projecto_grupo6/Tiendas/tienda.dart';
import 'shopOne.dart';

class Shop extends StatefulWidget {
  @override
  ShopApp createState() => ShopApp();
}

class ShopApp extends State<Shop> {
  tienda tiendaObjeto = new tienda();
  Widget build(BuildContext context) {


    return Scaffold(backgroundColor: Colors.white54,
      appBar: AppBar(backgroundColor: Colors.brown,
        title: Text("Lista de Tiendas"),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Tiendas").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(snapshot.data!.docs[index]
                                            .get("nombreTienda"))),
                                    Text(
                                      snapshot.data!.docs[index]
                                          .get("descripción"),
                                      style: TextStyle(
                                        color: Colors.green[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                child: Image.asset('image/' +
                                    snapshot.data!.docs[index].get("ruta")),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    tiendaObjeto.idTienda=snapshot.data!.docs[index].id;
                                    tiendaObjeto.nombre=snapshot.data!.docs[index].get("nombreTienda");
                                    tiendaObjeto.descripcion=snapshot.data!.docs[index].get("descripción");
                                    tiendaObjeto.imagen=snapshot.data!.docs[index].get("ruta");
                                    tiendaObjeto.website=snapshot.data!.docs[index].get("website");
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (_) => ShopOne(tiendaObjeto)));

                                  }, child: Text("entrar"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
