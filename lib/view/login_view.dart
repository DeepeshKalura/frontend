import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';

import '../controller/user_controller.dart';
import '../model/user.dart';
import 'home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginTexts loginTexts = LoginTexts(
      login: 'Login',
      loginEmailHint: 'Username',
    );

    return AnimatedLogin(
      loginTexts: loginTexts,
      onLogin: LoginFunctions(context).onLogin,
      validateEmail: false,
      validatePassword: false,
    );
  }
}

class LoginFunctions {
  final BuildContext context;
  LoginFunctions(this.context);
  Future<String?> onLogin(LoginData data) async {
    await Future.delayed(const Duration(seconds: 2));
    UserController userController = UserController();
    String username = data.email;
    try {
      // print("I am here");
      User user = await userController.signInUser(username);
      // print(user);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
      );
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
    return null;
  }
}
