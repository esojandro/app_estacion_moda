import 'package:app_estacion_moda/controllers/firestore_service.dart';
import 'package:app_estacion_moda/models/producto.dart';
import 'package:flutter/cupertino.dart';

class ProductoController with ChangeNotifier {
  final firestoreService = FirestoreService();

  int _cantidad_existente;
  //int idUsuario;
  String _descripcion;
  String _nombreproducto;
  int _precio;
  String _talla;
  //DocumentReference reference;

  // Getter Usuario
  int get cantidad_existente => _cantidad_existente;
  String get descripcion => _descripcion;
  String get nombreproducto => _nombreproducto;
  int get precio => _precio;
  String get talla => _talla;

  changeCantidad(int value) {
    _cantidad_existente = value;
    print(_cantidad_existente);
    notifyListeners();
  }

  changeDescripcion(String value) {
    _descripcion = value;
    print(_descripcion);
    notifyListeners();
  }

  changeNombreProducto(String value) {
    _nombreproducto = value;
    print(_nombreproducto);
    notifyListeners();
  }

  changePrecio(int value) {
    _precio = value;
    print(_precio);
    notifyListeners();
  }

  changeTalla(String value) {
    _talla = value;
    print(_talla);
    notifyListeners();
  }

  saveProducto() {
    print(
        "$_cantidad_existente, $_descripcion, $_nombreproducto, $_precio, $_talla");

    Producto producto = new Producto();
    producto.cantidad_existente = _cantidad_existente;
    producto.descripcion = _descripcion;
    producto.nombreproducto = _nombreproducto;
    producto.precio = _precio;
    producto.talla = _talla;
    print(producto.nombreproducto);
    firestoreService.setProducto(producto);
  }
}
