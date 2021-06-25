import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarritoCompras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                "Carrito de Compras",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              backgroundColor: Colors.pink.shade300,
              actions: [])),
    );
  }
}
