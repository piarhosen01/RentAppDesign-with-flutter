import 'package:flutter/material.dart';
import 'package:homerentapp/home/home_screen.dart';

void main() {
  runApp(const HomeRentApp());
}
class HomeRentApp extends StatelessWidget {
  const HomeRentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const home_screen()
    );
  }
}




