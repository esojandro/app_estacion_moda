import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RopaDama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                "Damas",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              backgroundColor: Colors.pink.shade300,
              actions: [])),
    );
  }
}
