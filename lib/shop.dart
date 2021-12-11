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
          _buildButtonColumn(color, Icons.add_location, "Ubicación"),
          _buildButtonColumn(color, Icons.web, "Website"),
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
          buttonSection,
          titleSection,
          buttonSection,
        ],
      ),
    );
  }
}
