import 'package:flutter/material.dart';
import 'package:level_1_task_gdg/screens/auth/login_view/login_view.dart';
import 'package:level_1_task_gdg/core/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.purple),
      ),
      home: const LoginView(),
    );
  }
}
