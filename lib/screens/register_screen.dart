import 'package:chat/constants.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static String id= 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 75,
          ),
          Image.asset(
            'assets/images/scholar.png',
            height: 100,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scholar Chat',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'pacifico'
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          const Text(
            'Register',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const CustomTextField(
            hintText: 'Email',
            icon:  Icon(Icons.email),
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextField(
            hintText: 'Password',
            icon: Icon(Icons.password),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const CustomButton(buttonText: 'Register'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account ? ',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:const Text(' LOGIN NOW !',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
