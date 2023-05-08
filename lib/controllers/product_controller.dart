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
      print("dimelo manzana");
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(Map<String, dynamic> update, int id) async {
    for (String k in update.keys) {
      products[id][k] = update[k];
    }
  }
}
