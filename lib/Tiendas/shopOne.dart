import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projecto_grupo6/Carrito/carrito.dart';
import 'package:projecto_grupo6/Productos/itemRegister.dart';
import 'package:projecto_grupo6/Tiendas/tienda.dart';
import 'package:projecto_grupo6/Usuarios/login.dart';
import 'package:projecto_grupo6/Usuarios/token.dart';
import 'package:projecto_grupo6/Carrito/shoppingCart.dart';

class ShopOne extends StatefulWidget {
  final tienda objaetoTienda;
  ShopOne(this.objaetoTienda);
  @override
  ShopOneApp createState() => ShopOneApp();
}

class ShopOneApp extends State<ShopOne> {
  String idUser = "";


  final firebase = FirebaseFirestore.instance;



  registrarCarrito(Carrito cart) async {
    try {
      await firebase.collection("Carrito").doc().set({
        "UserId":cart.idUser,
        "NombreTienda":cart.nombreTienda,
        "ProductoId":cart.idItem,
        "PrecioItem":cart.precioItem,
        "NombreItem":cart.nombreItem,
        "Descripcion":cart.descripcion,
        "Cantidad":cart.cantidad,
        "total":cart.total,

      });
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
                    widget.objaetoTienda.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.objaetoTienda.descripcion,
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
          Text("41"),
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
        widget.objaetoTienda.descripcion,
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: widget.objaetoTienda.nombre,
      home: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.objaetoTienda.nombre),
          actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ItemRegister(widget.objaetoTienda.idTienda)));
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
                    "image/" + widget.objaetoTienda.imagen,
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
                          widget.objaetoTienda.idTienda) {
                        return Card(
                          child: Column(
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
                                      onPressed: () async {
                                        token tk = new token();
                                        String idUserT = await tk.validarToken("");
                                        print(idUserT);
                                        if (idUserT == "vacio") {
                                          Navigator.push(context,MaterialPageRoute(builder: (_) => Login()));
                                        }else{
                                          Carrito cart=new Carrito();
                                          cart.precioItem=snapshot.data!.docs[index].get("Precio");
                                          cart.descripcion=snapshot.data!.docs[index].get("Descripcion");
                                          cart.idItem=snapshot.data!.docs[index].id;
                                          cart.idUser=idUserT;
                                          cart.nombreItem=snapshot.data!.docs[index].get("Nombre");
                                          cart.nombreTienda=widget.objaetoTienda.nombre;

                                          mensaje("Carrito","¿Desea agregar al carrito? Digite la cantidad",cart);
                                        }
                                      },
                                      heroTag:null,
                                       child:const Icon(Icons.add_shopping_cart),
                                      backgroundColor: Colors.teal,
                                      tooltip: "Añadir al Carrito",
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {},
                                      heroTag:null,
                                      child: Text("Ver"),
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

  } void mensaje(String titulo, String mess, Carrito cart) {
    TextEditingController cant=TextEditingController();
    cant.text="1";
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 5),
                child: TextField(
                  controller: cant,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Cantidad',
                    hintText: 'Digite la cantidad',
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  cart.cantidad=double.parse(cant.text);
                  cart.total=cart.cantidad*cart.precioItem;
                  registrarCarrito(cart);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ShoppingCart(cart.idUser)));
                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              ),RaisedButton(
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
