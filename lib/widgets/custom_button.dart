import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0
        ),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style:const TextStyle(
              fontSize: 22,
              color: Color(0xff2B457E),
            ),
          ),
        ),
      ),
    );
  }
}
