import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/thearpy.dart';

class ChatController {
  final String baseUrl = "http://0.0.0.0:8000";

  Future<String> createSession(String userId) async {
    final url = "$baseUrl/v1/convex/heal/$userId";
    var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      String sessionId = jsonDecode(response.body)["id"];
      return sessionId;
    } else {
      throw Exception("Failed to create session");
    }
  }

  Future<String> sendMessage(String sessionId, String message) async {
    final url = "$baseUrl/v1/convex/heal";
    var data = {
      "session_id": sessionId,
      "message": message,
    };

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Thearpy thearpy = Thearpy.fromJson(response.body);
      return thearpy.response;
    } else {
      throw Exception("Failed to send message");
    }
  }
}
