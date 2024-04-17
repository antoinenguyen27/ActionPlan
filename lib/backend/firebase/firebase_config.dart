import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "",
            authDomain: "actionplan-qmnjbb.firebaseapp.com",
            projectId: "actionplan-qmnjbb",
            storageBucket: "actionplan-qmnjbb.appspot.com",
            messagingSenderId: "605438947807",
            appId: "1:605438947807:web:4794718b62baf9d518146a"));
  } else {
    await Firebase.initializeApp();
  }
}
