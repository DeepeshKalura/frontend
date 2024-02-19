import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController {
  final String baseUrl = "https://text-to-speech-uajn.onrender.com";

  // Later I will add different types of method to handle the user data
  Future<void> signInUser(String username) async {
    String url = "$baseUrl/v1/cup/users/";
    var data = {
      "name": username,
      "token": math.Random().nextInt(100000).toString(),
      "pyq_score": "23.45",
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));
    if (response.statusCode == 201) {
      print("User signed in successfully");
      print(response.body);
    } else {
      print("Failed to sign in user");
      print(response.body);
    }
  }
}

void main(List<String> args) {
  UserController userController = UserController();
  userController.signInUser("John Doe");
}
