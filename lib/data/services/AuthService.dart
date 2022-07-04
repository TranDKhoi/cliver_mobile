import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService {
  AuthService._initInstance();

  static AuthService instance = AuthService._initInstance();

  Future<http.Response> signIn({
    required BuildContext context,
    required User user,
  }) async {
    return await http.post(
      Uri.parse("/auth/signin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user.toJson(),
    );
  }
}
