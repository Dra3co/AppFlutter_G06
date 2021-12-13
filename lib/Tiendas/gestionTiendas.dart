import 'package:flutter/material.dart';
import 'package:projecto_grupo6/Tiendas/shopRegister.dart';
import 'shopRegister.dart';
import 'shop.dart';
import 'package:projecto_grupo6/buscar.dart';

class GestionTiendas extends StatefulWidget {
  @override
  GestionTiendasApp createState() => GestionTiendasApp();
}

class GestionTiendasApp extends State<GestionTiendas> {
  TextEditingController busqueda=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Gestion de Tiendas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ShopRegister()));
                  },
                  child: Text("Registro de Tiendas"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    // Navigator.push(context,
                    //  MaterialPageRoute(builder: (_) => ()));
                  },
                  child: Text("Modificar Tiendas"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Shop()));
                  },
                  child: Text("Listado de Tiendas"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: TextField(
                controller: busqueda,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Buscar Tienda ",
                  hintText: "Digite Palabra Calve de la Tienda",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(500, 50)),
                onPressed: () {
                  Navigator.push(

                      context, MaterialPageRoute(builder: (_) => Buscar(busqueda.text)));
                },
                child: Text("Buscar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
