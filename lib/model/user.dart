class User {
  double? creationTime;
  String? id;
  String? name;

  User({this.creationTime, this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    creationTime = json['_creationTime'];
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_creationTime'] = creationTime;
    data['_id'] = id;
    data['name'] = name;
    return data;
  }
}
