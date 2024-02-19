import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:healix_frontend/controller/user_controller.dart';
import 'package:healix_frontend/main.dart';
import 'package:healix_frontend/model/user.dart';

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
    print("I am printing username here");
    print(username);
    try {
      print("I am here");
      User user = await userController.signInUser(username);
      print(user);
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
