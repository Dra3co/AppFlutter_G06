import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Buscar extends StatefulWidget {
  final String searchWord;
  Buscar(this.searchWord);

  @override
  BuscarApp createState() => BuscarApp();
}

class BuscarApp extends State<Buscar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Buqueda"),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Tiendas").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              //print(widget.searchWord);
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data!.docs[index].get("nombreTienda").toString().contains(widget.searchWord)
                      ) {
                    //print(snapshot.data!.docs[index].get("nombreTienda"));

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
                                    onPressed: () {}, child: Text("entrar"))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return new Card();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
