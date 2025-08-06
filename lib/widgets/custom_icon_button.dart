import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  const CustomIconButton({
    required this.icon,
    this.color = Colors.white,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      onPressed: () {
        // Handle contact button press
      },
    );
  }
}