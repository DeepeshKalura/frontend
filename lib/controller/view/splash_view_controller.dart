import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../view/anyomous_view.dart';
import '../../view/home_view.dart';
import '../shared_preference_controller.dart';
import '../user_controller.dart';

class SplashViewController {
  var userController = UserController();
  var sharedPreferencesController = SharedPreferencesController();
  SplashViewController();

  late String userId;

  Future<User> getUser() async {
    var user = await userController.getUser(userId);
    return user;
  }

  Future<bool> checkUser() async {
    var id = await sharedPreferencesController.getString("id");
    print(id); // why there is null i wonder ?
    if (id == null) {
      return false;
    } else {
      userId = id;
      return true;
    }
  }

  Future<Widget> navigateToAppropriateScreen() async {
    if (await checkUser()) {
      var user = await getUser();
      return HomeScreen(user: user);
    } else {
      return const AnyomousView();
    }
  }
}
