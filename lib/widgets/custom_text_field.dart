import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key, required this.icon, required this.hintText, this.onChanged, this.obsecureText= false});

  final Icon icon;
  final String hintText;
  Function(String)? onChanged;
  final bool? obsecureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        obscureText: obsecureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'you must enter your data';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: Colors.white,
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
