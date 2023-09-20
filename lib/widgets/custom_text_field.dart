import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.icon, required this.hintText});

  final Icon icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: Colors.white,
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border:const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}