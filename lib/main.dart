import 'package:air_control_app/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  //initializeDateFormatting('pl');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class Strings {
  static const String appTitle = 'Air Control';
}
