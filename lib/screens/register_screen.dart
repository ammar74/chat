import 'package:chat/constants.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/widgets/custom_button.dart';
import 'package:chat/widgets/custom_text_field.dart';
import 'package:chat/widgets/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                kLogo,
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
                        fontFamily: 'pacifico'),
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
              CustomFormTextField(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
                icon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormTextField(
                obsecureText: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
                icon: const Icon(Icons.password),
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await registerUser();
                      Navigator.pushNamed(
                          context, ChatScreen.id,
                          arguments: email,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showSnackBar(context,
                            'the password is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context,
                            'The account already exists for that email.');
                      }
                    } catch (e) {
                      showSnackBar(
                          context, e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  } else {}
                },
                buttonText: 'Register',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account ? ',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      ' LOGIN NOW !',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
