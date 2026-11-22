import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_api_app/feature/users/presentation/binding/user_binding.dart';
import 'package:users_api_app/feature/users/presentation/screens/user_screen_with_getx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Users API With GetX',

      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      initialBinding: UserBinding(),

      home: const UserScreenWithGetx(),
    );
  }
}
