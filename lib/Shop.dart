import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  ShopApp createState() => ShopApp();
}

class ShopApp extends State<Shop> {
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "comidas rapidas el gordo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Perros calientes, Hamburguesas y más...",
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
            child: Image.asset("image/gordo.png"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("entrar"))
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tiendas"),
      ),
      body: ListView(
        children: [
          Image.asset(
            "image/logo_gordo.png",
            width: 400,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          titleSection
        ],
      ),
    );
  }
}
