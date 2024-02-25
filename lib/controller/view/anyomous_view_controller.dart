import '../../model/user.dart';
import '../user_controller.dart';
import '../shared_preference_controller.dart';

class AnyomousViewController {
  var userController = UserController();
  final spController = SharedPreferencesController();

  Future<User> createUser(String username) async {
    var user = await userController.signInUser(username);
    print("User id: ${user.id}");
    print("User name: ${user.name}");
    await spController.setString("id", user.id!);

    print(
        "User id from shared preference: ${await spController.getString("id")}");

    return user;
  }
}
