import 'package:flutter/material.dart';
import 'package:homerentapp/home/home_screen.dart';
import 'package:homerentapp/home/sevice_details_screen.dart';

void main() {
  runApp(const HomeRentApp());
}
class HomeRentApp extends StatelessWidget {
  const HomeRentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const service_details_screen()
    );
  }
}




