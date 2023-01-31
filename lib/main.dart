import 'package:flutter/material.dart';
import 'package:yuktidea_task/presentation/screens/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuktidea Task',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const StartUpScreen(),
    );
  }
}
