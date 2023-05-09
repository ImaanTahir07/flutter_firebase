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
    apiKey: 'AIzaSyAAW1ThLmbs4x6smvE5bTyG6HUHzlyh9ZM',
    appId: '1:738919273601:web:1d9530f4f1d62bb2af6980',
    messagingSenderId: '738919273601',
    projectId: 'myproject-ec38b',
    authDomain: 'myproject-ec38b.firebaseapp.com',
    storageBucket: 'myproject-ec38b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXDfHOwIZkcQi_Zqea8ExOKFzBeaCdqs4',
    appId: '1:738919273601:android:7e5eb657e067bd79af6980',
    messagingSenderId: '738919273601',
    projectId: 'myproject-ec38b',
    storageBucket: 'myproject-ec38b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCy2fopYuCBYjGjheiPJsZZWPqilj7yir8',
    appId: '1:738919273601:ios:2d54287ee5ec0e14af6980',
    messagingSenderId: '738919273601',
    projectId: 'myproject-ec38b',
    storageBucket: 'myproject-ec38b.appspot.com',
    iosClientId: '738919273601-qbfutj25bj4vse9f58ebirl50oqv0oqh.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCy2fopYuCBYjGjheiPJsZZWPqilj7yir8',
    appId: '1:738919273601:ios:2d54287ee5ec0e14af6980',
    messagingSenderId: '738919273601',
    projectId: 'myproject-ec38b',
    storageBucket: 'myproject-ec38b.appspot.com',
    iosClientId: '738919273601-qbfutj25bj4vse9f58ebirl50oqv0oqh.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase',
  );
}