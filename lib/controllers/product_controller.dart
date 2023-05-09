import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

class Product_Controller extends GetxController {
  List<Map<String, dynamic>> products = [];
  final databaseRef = FirebaseDatabase.instance.ref();
  Future<void> createProduct(Map<String, dynamic> product) async {
    products.add(product);
    try {
      await databaseRef.child('productList').push().set(product);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(Map<String, dynamic> update, int id) async {
    for (String k in update.keys) {
      products[id][k] = update[k];
    }
  }

  Future<void> cleanProducts() async {
    products.clear();
  }

  Future<void> getUserProducts(String uid) async {
    try {
      final productRef = await databaseRef.child('productList');

      final query = productRef.orderByChild('uid').equalTo(uid);

      await query.once().then((DatabaseEvent event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? values =
              event.snapshot.value as Map<dynamic, dynamic>;
          values.forEach((key, values) {
            print(values);
            final Map<String, dynamic> product = {
              "almacenamiento": values['almacenamiento'],
              "cantidad": values['cantidad'],
              "categoria": values['categoria'],
              "fecha": values['fecha'],
              "nombre": values['nombre'],
              "uid": values['uid'],
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
