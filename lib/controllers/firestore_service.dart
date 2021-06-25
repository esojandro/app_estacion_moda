import 'package:app_estacion_moda/models/producto.dart';
import 'package:app_estacion_moda/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  var _dbEstacionModa = FirebaseFirestore.instance;

  // Get Usuarios

  Stream<List<Usuario>> getUsuarios() {
    return _dbEstacionModa.collection('Usuario').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Usuario.fromJson(doc.data())).toList());
  }

  Stream<List<Producto>> getProducto() {
    return _dbEstacionModa.collection('Producto').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Producto.fromJson(doc.data())).toList());
  }

  Future<void> setUsuario(Usuario user) async {
    //var options = SetOptions(merge: true);
    print(user.toMap().toString());
    print(user.toMap().isEmpty);

    var usuarioRecibido =
        await _dbEstacionModa.collection('Usuario').add(user.toMap());
    print(usuarioRecibido.id);

    /*return _dbEstacionModa
        .collection('Usuario')
        .doc(user.idUserFirebase)
        .set(user.toMap());
        */
  }

  Future<void> setProducto(Producto producto) async {
    //var options = SetOptions(merge: true);
    print(producto.toMap().toString());
    print(producto.toMap().isEmpty);

    var productoRecibido =
        await _dbEstacionModa.collection('Producto').add(producto.toMap());
    print(productoRecibido.id);
  }

  Future<void> removeUsuario(String userId) {
    return _dbEstacionModa.collection('Usuario').doc(userId).delete();
  }

  Future<void> removeProducto(String productoId) {
    return _dbEstacionModa
        .collection('id_producto')
        .doc(productoId)
        .delete(); // Aqui va igual que los valores de la BD firebase
  }
}
