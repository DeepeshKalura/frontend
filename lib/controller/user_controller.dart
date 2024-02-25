import 'dart:convert';

// import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import '../model/user.dart' as model;

class UserController {
  // final String baseUrl = "https://text-to-speech-uajn.onrender.com";
  final String baseUrl = "http://127.0.0.1:8000";

  Future<model.User> signInUser(String username) async {
    String url = "$baseUrl/v1/cup/users/";
    var data = {
      "name": username,
    };
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: headers);

    if (response.statusCode == 201) {
      model.User user = model.User.fromJson(response.body);
      return user;
    } else {
      throw Exception("Failed to sign in user");
    }
  }

  Future<model.User> getUser(String id) async {
    String url = "$baseUrl/v1/cup/users/$id";
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      model.User user = model.User.fromJson(response.body);
      return user;
    } else {
      throw Exception("Failed to get user");
    }
  }
}
