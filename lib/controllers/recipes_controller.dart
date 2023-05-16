import 'package:efood/controllers/product_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  List<Map<dynamic, dynamic>> recipes = [];
  final databaseRef = FirebaseDatabase.instance.ref();
  final Product_Controller productController = Get.find();

  Future<void> getRecipes() async {
    try {
      final productRef = await databaseRef.child('recipes');
      final snapshot = await productRef.get();

      if (snapshot.exists) {
        Map<dynamic, dynamic>? vals = snapshot.value as Map<dynamic, dynamic>;
        recipes.add(vals);
      }
    } catch (e) {
      print(e);
    }
  }

  String getInstructions(String name) {
    String instructions = "";
    recipes.forEach((element) {
      element.forEach((key, value) {
        if (key == name) {
          instructions = value["instructions"];
        }
      });
    });
    return instructions;
  }

  Map<dynamic, dynamic> getIngredients(String name) {
    Map<dynamic, dynamic> ingredients = {};
    recipes.forEach((element) {
      element.forEach((key, value) {
        if (key == name) {
          ingredients = value;
        }
      });
    });

    ingredients.remove("instructions");
    return ingredients;
  }
}
