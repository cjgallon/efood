import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Object validator() {
    final email = getEmailText();
    final password = getPasswordText();

    if (email.isEmpty) {
      return 'Email is required';
    }

    if (password.isEmpty) {
      return 'Password is required';
    }

    if (!emailValid(email)) {
      return 'Email is invalid';
    }

    return true;
  }

  bool emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String getEmailText() {
    return emailController.text;
  }

  String getPasswordText() {
    return passwordController.text;
  }
}
