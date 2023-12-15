import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBMkM93Y9vJe3WPf8BWYD2oMhCJxZzR3h0",
            authDomain: "actions-dd2b5.firebaseapp.com",
            projectId: "actions-dd2b5",
            storageBucket: "actions-dd2b5.appspot.com",
            messagingSenderId: "141330271572",
            appId: "1:141330271572:web:761257d6ef1ecd94aaccc1",
            measurementId: "G-K7YJR1WCR4"));
  } else {
    await Firebase.initializeApp();
  }
}
