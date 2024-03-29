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
    apiKey: 'AIzaSyCZtKE0d3t6H5Gf3XcNvzhKiLHga5HydHU',
    appId: '1:368918004370:web:1ce1bd2b1e5ee6f4e6dc4b',
    messagingSenderId: '368918004370',
    projectId: 'chat--app-dadf3',
    authDomain: 'chat--app-dadf3.firebaseapp.com',
    storageBucket: 'chat--app-dadf3.appspot.com',
    measurementId: 'G-KPKLZ4E4TV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWBnB6-_Z7GGHnvMjgwuK0ho-G6r_70DQ',
    appId: '1:368918004370:android:8582501c23ee776ae6dc4b',
    messagingSenderId: '368918004370',
    projectId: 'chat--app-dadf3',
    storageBucket: 'chat--app-dadf3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCluj5kOaUd6fBzlJ7J30pnOtgCmaGt860',
    appId: '1:368918004370:ios:6cc9f3ee528e81f5e6dc4b',
    messagingSenderId: '368918004370',
    projectId: 'chat--app-dadf3',
    storageBucket: 'chat--app-dadf3.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCluj5kOaUd6fBzlJ7J30pnOtgCmaGt860',
    appId: '1:368918004370:ios:a5138f5cba3c0b9fe6dc4b',
    messagingSenderId: '368918004370',
    projectId: 'chat--app-dadf3',
    storageBucket: 'chat--app-dadf3.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
