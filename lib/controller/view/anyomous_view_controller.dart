import 'dart:developer';

import '../../model/user.dart';
import '../user_controller.dart';
import '../shared_preference_controller.dart';

class AnyomousViewController {
  var userController = UserController();
  final spController = SharedPreferencesController.getInstance();
  bool isLogin = false;

  Future<User> createUser(String username) async {
    isLogin = true;
    var user = await userController.signInUser(username);
    await spController.setString("id", user.id);
    log("User id: ${user.id}");
    isLogin = false;
    return user;
  }
}
