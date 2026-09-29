// File generated for project labexam2-murillo
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        return android;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDpuckiPi-Pni_cG__Nix4GShtP8Rik-1g',
    appId: '1:988437358510:web:4390e7291725c730690a3f',
    messagingSenderId: '988437358510',
    projectId: 'labexam2-murillo',
    authDomain: 'labexam2-murillo.firebaseapp.com',
    storageBucket: 'labexam2-murillo.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTNphhEwEU_wpnO94S8xpbW9sxi1anLlE',
    appId: '1:988437358510:android:d0b848ce211f9ba6690a3f',
    messagingSenderId: '988437358510',
    projectId: 'labexam2-murillo',
    storageBucket: 'labexam2-murillo.firebasestorage.app',
  );
}
