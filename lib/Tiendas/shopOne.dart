import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projecto_grupo6/Productos/itemRegister.dart';

class ShopOne extends StatefulWidget {
  final String DOC_ID;
  ShopOne(this.DOC_ID);
  @override
  ShopOneApp createState() => ShopOneApp();
}

class ShopOneApp extends State<ShopOne> {
  ShopOneApp() {
    validarDatos();
  }
  //String titulo = "default";
  String nombre = "default name";
  String descCorta = "default short";
  String descLarga = "default long";
  String visitas = "41";
  String logo = "logo.png";
  String tiendaId = "";

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Tiendas");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.id == widget.DOC_ID.toString()) {
            //String titulo
            this.nombre = cursor.get("nombreTienda");
            this.descCorta = cursor.get("descripción");
            this.tiendaId = cursor.id;
            //String descLarga = "default long";
            //String visitas = "defeult num";
            logo = cursor.get("ruta");
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
    Widget titleSection = Container(
      padding: const EdgeInsets.all(23),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    this.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  this.descCorta,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(this.visitas),
        ],
      ),
    );
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, "Llamar"),
          _buildButtonColumn(color, Icons.location_on, "Ubicación"),
          _buildButtonColumn(color, Icons.web, "Website"),
        ],
      ),
    );

    Widget textSection = Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        this.descLarga,
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: this.nombre,
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.nombre),
          actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ItemRegister(tiendaId)));
              },
              tooltip: "Agregar Producto",
              child: Text("Añadir"),
              backgroundColor: Colors.white38,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Image.asset(
                    "image/" + logo,
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  titleSection,
                  buttonSection,
                  //textSection,
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Productos")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (snapshot.data!.docs[index].get("TiendaID") ==
                          this.tiendaId) {
                        return new Card(
                          child: new Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text(snapshot
                                                  .data!.docs[index]
                                                  .get("Nombre"))),
                                          Text(
                                            snapshot.data!.docs[index]
                                                .get("Descripcion"),
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
                                      child: Image.asset(
                                          'image/' /*+
                                        snapshot.data!.docs[index].get("ruta")*/
                                          ),
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context, MaterialPageRoute(builder: (_) => ItemRegister(tiendaId)));
                                      },

                                      tooltip: "Añadir al Carrito",
                                      child:const Icon(Icons.add_shopping_cart),
                                      // child: Text("Añadir"),
                                      backgroundColor: Colors.teal,
                                    ),FloatingActionButton(
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context, MaterialPageRoute(builder: (_) => ItemRegister(tiendaId)));
                                      },

                                      child: Text("Ver"),
                                      //child:const Icon(Icons.add_shopping_cart),
                                      // child: Text("Añadir"),
                                      backgroundColor: Colors.indigoAccent,
                                      tooltip: "Ver Producto",
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return new Card();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
