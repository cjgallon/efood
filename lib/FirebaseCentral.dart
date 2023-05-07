import 'package:efood/pages/HomePage.dart';
import 'package:efood/pages/LetsBegin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseCentral extends StatelessWidget {
  const FirebaseCentral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // aquí dependiendo del estado de autenticación, el cual
    // obtenemos en el stream, vamos a cargar la interfaz de autenticación
    // o el UserListPage
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePageWidget();
          } else {
            return const LetsBeginWidget();
          }
        });
  }
}
