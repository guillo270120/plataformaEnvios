import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAi3p7PVI8z9qkHaxriG7x92POBqfCH45I",
            authDomain: "plataforma-7f84e.firebaseapp.com",
            projectId: "plataforma-7f84e",
            storageBucket: "plataforma-7f84e.appspot.com",
            messagingSenderId: "120922735917",
            appId: "1:120922735917:web:a24a47e89e98b3ed37bfa4",
            measurementId: "G-CBDH19WSPR"));
  } else {
    await Firebase.initializeApp();
  }
}
