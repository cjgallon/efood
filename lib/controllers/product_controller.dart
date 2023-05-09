import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

class Product_Controller extends GetxController {
  List<Map<String, dynamic>> products = [];
  final databaseRef = FirebaseDatabase.instance.ref();
  Map<String, dynamic>? selectedProduct;
  Future<void> createProduct(Map<String, dynamic> product) async {
    products.add(product);
    try {
      await databaseRef.child('productList').push().set(product);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(
      Map<String, dynamic> update, int id, String pid) async {
    final prodUpdate = databaseRef.child("productList").child(pid);
    prodUpdate.update(update).then((value) => print("yello"));
    for (String k in update.keys) {
      products[id][k] = update[k];
    }
  }

  Future<void> updateSelected(Map<String, dynamic> update) async {
    updateProduct(
        update, products.indexOf(selectedProduct!), selectedProduct!["pid"]);
  }

  Future<void> cleanProducts() async {
    products.clear();
  }

  Future<void> removeProduct(String pid) async {
    final prodUpdate = databaseRef.child("productList").child(pid);
    prodUpdate.remove().then((value) => print("removed $pid"));
  }

  Future<void> removeSelected() async {
    products.removeAt(products.indexOf(selectedProduct!));
    removeProduct(selectedProduct!["pid"]);
  }

  Future<void> getUserProducts(String uid) async {
    try {
      final productRef = await databaseRef.child('productList');

      final query = productRef.orderByChild('uid').equalTo(uid);

      await query.once().then((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? vals =
              event.snapshot.value as Map<dynamic, dynamic>;
          vals.forEach((key, values) {
            print(key);

            final Map<String, dynamic> product = {
              "almacenamiento": values['almacenamiento'],
              "cantidad": values['cantidad'],
              "categoria": values['categoria'],
              "fecha": values['fecha'],
              "nombre": values['nombre'],
              "uid": values['uid'],
              "pid": key
            };
            products.add(product);
          });
        }
      });

      print("dimelo manzana");
    } catch (e) {
      print(e);
    }
  }
}
