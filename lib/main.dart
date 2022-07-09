import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initData();
  runApp(const MyApp());
}

initData() async {
  var pref = await SharedPreferences.getInstance();
  UserController.instance.isFirstTime = pref.getBool("isFirstTime") ?? true;
}
