import 'package:efood/FirebaseCentral.dart';
import 'package:efood/config/configuration.dart';
import 'package:efood/controllers/notif_controller.dart';
import 'package:efood/controllers/product_controller.dart';
import 'package:efood/controllers/recipes_controller.dart';
import 'package:efood/controllers/ui_controller.dart';
import 'package:flutter/material.dart';
// import 'package:efood/pages/Reminder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

import 'pages/AddProduct.dart';
import 'pages/ProductDetails.dart';
import 'pages/login.dart';
import 'pages/Recepies.dart';
import 'pages/HomePage.dart';
import 'pages/Reminder.dart';
import 'pages/LetsBegin.dart';
import 'pages/Signup.dart';
import 'pages/user_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: Configuration.apiKey,
    authDomain: Configuration.authDomain,
    databaseURL: Configuration.databaseURL,
    projectId: Configuration.projectId,
    // storageBucket: Configuration.storageBucket,
    messagingSenderId: Configuration.messagingSenderId,
    appId: Configuration.appId,
    // measurementId: Configuration.measurementId),
  ));

  runApp(const MyApp());
}

//holaaa
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(NotifController());
    Get.put(AuthenticationController());
    Get.put(UIController());
    Get.put(Product_Controller());
    Get.put(RecipeController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Raleway",
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 30),
              displayMedium: TextStyle(fontSize: 20),
              displaySmall: TextStyle(fontSize: 13),
              bodySmall: TextStyle(fontSize: 9)),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF368C72))),
      home: FirebaseCentral(),
      routes: {
        "/homepage": (context) => const HomePageWidget(),
        "/letsbegin": (context) => const LetsBeginWidget(),
        "/signup": (context) => const SignupWidget(),
        "/reminder": (context) => const ReminderWidget(),
        "/login": (context) => const LoginWidget(),
        "/productdetails": (context) => const ProductDetailsWidget(),
        "/addproduct": (context) => const AddProductWidget(),
        "/recepies": (context) => const RecipesWidget(),
        "/user": (context) => const UserConfigWidget()
      },
    );
  }
}
