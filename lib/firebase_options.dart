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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC28AUL5Ee21ESe2-Q9jclNfYitiKu9D_k',
    appId: '1:446897243634:web:801ae13a766e09c6d3176b',
    messagingSenderId: '446897243634',
    projectId: 'notification-todo-de407',
    authDomain: 'notification-todo-de407.firebaseapp.com',
    storageBucket: 'notification-todo-de407.appspot.com',
    measurementId: 'G-PXY9CTQYY5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8rDkHbKDYOS2LbeElJ5XlWYZwshlKXpA',
    appId: '1:446897243634:android:2ab317f54a635dfbd3176b',
    messagingSenderId: '446897243634',
    projectId: 'notification-todo-de407',
    storageBucket: 'notification-todo-de407.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfOwZpF_Hbk7WUmYckCqU-v7ayzdsDhgc',
    appId: '1:446897243634:ios:ab5177d72fa92879d3176b',
    messagingSenderId: '446897243634',
    projectId: 'notification-todo-de407',
    storageBucket: 'notification-todo-de407.appspot.com',
    iosClientId: '446897243634-28r6u55bq0qam0iieof9u4fpsq033eov.apps.googleusercontent.com',
    iosBundleId: 'com.example.verygoodcore.notification-todo',
  );
}