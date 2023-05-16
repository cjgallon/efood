import 'package:efood/controllers/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginController', () {
    late LoginController controller;

    setUp(() {
      controller = LoginController();
    });

    test('Valid email returns true', () {
      expect(controller.emailValid("user@mail.com"), isTrue);
    });

    test('Invalid email returns false', () {
      expect(controller.emailValid("this is not a valid email"), isFalse);
    });

    test('Empty email returns error message', () {
      controller.emailController.text = '';

      // Assert
      expect(controller.validator(), 'Email is required');
    });

    test('Empty password returns error message', () {
      controller.emailController.text = 'user@mail.com';
      controller.passwordController.text = '';

      expect(controller.validator(), 'Password is required');
    });

    test('Email and password must be correct', () {
      // Arrange
      controller.emailController.text = 'user@mail.com';
      controller.passwordController.text = 'password123';

      expect(controller.validator(), isTrue);
    });

    test('getEmail must return a valid user email', () {
      controller.emailController.text = 'user@mail.com';
      expect(controller.getEmailText(), controller.emailController.text);
    });

    test('getPassword must return a valid user password', () {
      controller.passwordController.text = 'password123';
      expect(controller.getPasswordText(), controller.passwordController.text);
    });

    tearDown(() {
      controller.onClose();
    });
  });
}
