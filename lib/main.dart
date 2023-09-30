import 'package:chat/firebase_options.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/loading_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
