import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import '../model/user.dart' as model;

class UserController {
  final String baseUrl = "https://text-to-speech-uajn.onrender.com";

  Future<model.User> signInUser(String username) async {
    String url = "$baseUrl/v1/cup/users/";
    var data = {
      "name": username,
      "token": Random().nextInt(100000).toString(),
      "pyq_score": "23.45",
    };
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: headers);
    print("I like balls");
    if (response.statusCode == 201) {
      print("I reached here");
      model.User user = model.User.fromJson(response.body);
      print(user);

      print("I have user ${user.toString()}");
      return user;
    } else {
      print("I am eceptions");
      throw Exception("Failed to sign in user");
    }
  }
}
