import 'dart:convert';

class User {
  late String? id;
  late String? name;
  late String? username;
  late String? password;
  late String? type;
  late String? token;

  User(
      {this.id,
      this.name,
      this.username,
      this.password,
      this.type,
      this.token});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'type': type,
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> source) => User.fromMap(source);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }
}
