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
    apiKey: 'AIzaSyCAOWeZi1WraKfNVxMzcQqeDIbDm4zV5Qg',
    appId: '1:576664634524:web:3ba4d4b403756192419959',
    messagingSenderId: '576664634524',
    projectId: 'futchemistryapp',
    authDomain: 'futchemistryapp.firebaseapp.com',
    storageBucket: 'futchemistryapp.appspot.com',
    measurementId: 'G-5F5TL8C4TN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPkWa2eNW1m1whT6O7kOy6AOQ9yhw6u6c',
    appId: '1:576664634524:android:4764ffc8326e9751419959',
    messagingSenderId: '576664634524',
    projectId: 'futchemistryapp',
    storageBucket: 'futchemistryapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANsFsT4v80K2fmNEYsQFKJXY5sZr6LnEU',
    appId: '1:576664634524:ios:a272f2bf61261e16419959',
    messagingSenderId: '576664634524',
    projectId: 'futchemistryapp',
    storageBucket: 'futchemistryapp.appspot.com',
    iosClientId: '576664634524-33707rsob3h85iarv7ito3tandufe75m.apps.googleusercontent.com',
    iosBundleId: 'com.futfc.futchemistry',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANsFsT4v80K2fmNEYsQFKJXY5sZr6LnEU',
    appId: '1:576664634524:ios:1a4d07a396f7eedf419959',
    messagingSenderId: '576664634524',
    projectId: 'futchemistryapp',
    storageBucket: 'futchemistryapp.appspot.com',
    iosClientId: '576664634524-l1enejmhtr7esqrde4lp0rdomsjtq8c1.apps.googleusercontent.com',
    iosBundleId: 'com.thupvvvv.boilerplate.tinyAppBoilerplate',
  );
}