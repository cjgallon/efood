import 'package:flutter/material.dart';
import 'pages/AddProduct.dart';
import 'pages/ProductDetails.dart';
import 'pages/Login.dart';
import 'pages/HomePage.dart';
import 'pages/Reminder.dart';
import 'pages/LetsBegin.dart';
import 'pages/Signup.dart';

void main() {
  runApp(const MyApp());
}

//holaaa
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LetsBeginWidget(),
      routes: {
        "/homepage": (context) => const HomePageWidget(),
        "/letsbegin": (context) => const LetsBeginWidget(),
        "/signup": (context) => const SignupWidget(),
        "/reminder": (context) => const ReminderWidget(),
        "/login": (context) => const LoginWidget(),
        "/productdetails": (context) => const ProductDetailsWidget(),
        "/addproduct": (context) => const AddProductWidget()
      },
    );
  }
}
