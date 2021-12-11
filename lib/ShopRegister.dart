import 'package:flutter/material.dart';

class ShopRegister extends StatefulWidget {
  @override
  ShopRegisterApp createState() => ShopRegisterApp();
}

class ShopRegisterApp extends State<ShopRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Tiendas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: TextField(
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
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Ruta de la Imagen",
                  hintText:"Digite ruta de la imagen",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Descripción Tienda",
                  hintText:"Digite descripción de la Tienda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:15, top: 15,right: 15,bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "pagina web",
                  hintText:"Digite pagina web de la Tienda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
