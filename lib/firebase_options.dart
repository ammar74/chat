// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBhqJPv-qcJ4uQPHTNNU0JHLGbGVqoBinc',
    appId: '1:641336120293:web:7bb58d7442af70206d550c',
    messagingSenderId: '641336120293',
    projectId: 'chat-84561',
    authDomain: 'chat-84561.firebaseapp.com',
    storageBucket: 'chat-84561.appspot.com',
    measurementId: 'G-LYCV3ZYXWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrbjLX1UmK08U70GPFRpCdkLXZxYpaNLk',
    appId: '1:641336120293:android:ef8a4b785f8d1f106d550c',
    messagingSenderId: '641336120293',
    projectId: 'chat-84561',
    storageBucket: 'chat-84561.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUAiHy4Iy67gr2gvmyYo0Yx3VKjUu3zMg',
    appId: '1:641336120293:ios:a66d16f31e13c1c46d550c',
    messagingSenderId: '641336120293',
    projectId: 'chat-84561',
    storageBucket: 'chat-84561.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUAiHy4Iy67gr2gvmyYo0Yx3VKjUu3zMg',
    appId: '1:641336120293:ios:8ad332ac64f52b0c6d550c',
    messagingSenderId: '641336120293',
    projectId: 'chat-84561',
    storageBucket: 'chat-84561.appspot.com',
    iosBundleId: 'com.example.chat.RunnerTests',
  );
}
