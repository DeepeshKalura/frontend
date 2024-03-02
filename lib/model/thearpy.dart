// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Thearpy {
  final double creationTime;
  final String id;
  final String message;
  final String response;
  final double sentimentCompound;
  final String sessionId;
  Thearpy({
    required this.creationTime,
    required this.id,
    required this.message,
    required this.response,
    required this.sentimentCompound,
    required this.sessionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'creationTime': creationTime,
      'id': id,
      'message': message,
      'response': response,
      'sentimentCompound': sentimentCompound,
      'sessionId': sessionId,
    };
  }

  factory Thearpy.fromMap(Map<String, dynamic> map) {
    return Thearpy(
      creationTime: map['creationTime'] as double,
      id: map['id'] as String,
      message: map['message'] as String,
      response: map['response'] as String,
      sentimentCompound: map['sentimentCompound'] as double,
      sessionId: map['sessionId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thearpy.fromJson(String source) =>
      Thearpy.fromMap(json.decode(source) as Map<String, dynamic>);
}
