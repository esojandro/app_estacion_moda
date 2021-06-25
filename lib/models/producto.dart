import 'dart:convert';

Producto userFromJson(String str) => Producto.fromJson(json.decode(str));

String userToJson(Producto data) => json.encode(data.toJson());

class Producto {
  int cantidad_existente;
  //int idUsuario;
  String descripcion;
  String nombreproducto;
  int precio;
  //int id_producto;
  String talla;
  //DocumentReference reference;

  Producto(
      {this.cantidad_existente,
      //this.idUsuario,
      this.descripcion,
      this.nombreproducto,
      this.precio,
      // this.id_producto,
      this.talla});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      cantidad_existente: json['cantidad_existente'],
      //idUsuario: json['idUsuarios'],
      descripcion: json['descripcion'],
      nombreproducto: json['nombreproducto'],
      precio: json['precio'],
      //  id_producto: json['id_producto'],
      talla: json['talla'],
    );
  }

  Map<String, dynamic> toJson() => {
        "cantidad_existente": cantidad_existente,
        "descripcion": descripcion,
        "nombreproducto": nombreproducto,
        "precio": precio,
        //  "id_producto": id_producto,
        "talla": talla
      };

  Map<String, dynamic> toMap() {
    return {
      "cantidad_existente": cantidad_existente,
      "descripcion": descripcion,
      "nombreproducto": nombreproducto,
      "precio": precio,
      //  "id_producto": id_producto,
      "talla": talla
    };
  }
}
