import 'dart:convert';

class User {
  final String name;
  final String id;
  final String createdAt;
  User({
    required this.name,
    required this.id,
    required this.createdAt,
  });

  User copyWith({
    String? name,
    String? token,
    String? pyqScore,
    String? id,
    String? createdAt,
  }) {
    return User(
      name: name ?? this.name,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'createdAt': createdAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id && other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ createdAt.hashCode;
  }
}
