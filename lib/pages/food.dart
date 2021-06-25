import 'package:app_estacion_moda/controllers/login.controller.dart';
import 'package:app_estacion_moda/pages/carritoCompras.dart';
import 'package:app_estacion_moda/pages/ropaCaballero.dart';
import 'package:app_estacion_moda/pages/ropaDama.dart';
//import 'package:app_estacion_moda/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class FoodPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Estacion Moda",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.pink.shade300,
          actions: []),
      drawer: Drawer(
        child: Container(
          color: Colors.grey.shade400,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              buildMenuItem(
                text: 'Carrito de Compras',
                icon: Icons.shopping_cart_sharp,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(
                height: 30,
              ),
              buildMenuItem(
                  text: 'Ropa de Dama',
                  icon: Icons.pregnant_woman,
                  onClicked: () => selectedItem(context, 1)),
              const SizedBox(
                height: 30,
              ),
              buildMenuItem(
                  text: 'Ropa de Caballero',
                  icon: Icons.people_alt_outlined,
                  onClicked: () => selectedItem(context, 2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CarritoCompras(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RopaDama(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RopaCaballero(),
        ));
        break;
    }
  }
}
