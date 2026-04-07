import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB4OWnLsWpnKaQGezSGWTXSZffMRsycsSE",
            authDomain: "site-app-y2acg1.firebaseapp.com",
            projectId: "site-app-y2acg1",
            storageBucket: "site-app-y2acg1.appspot.com",
            messagingSenderId: "831243651820",
            appId: "1:831243651820:web:e08663d5ae16fcb51af3c9"));
  } else {
    await Firebase.initializeApp();
  }
}
