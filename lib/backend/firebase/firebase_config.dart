import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNXGvPIwawrVAljEKMRBV-HFJ72XrQjxk",
            authDomain: "carbonfight-89af6.firebaseapp.com",
            projectId: "carbonfight-89af6",
            storageBucket: "carbonfight-89af6.appspot.com",
            messagingSenderId: "11012056131",
            appId: "1:11012056131:web:8471007bc938aa82da60f6",
            measurementId: "G-HEPCN5Q1WE"));
  } else {
    await Firebase.initializeApp();
  }
}
