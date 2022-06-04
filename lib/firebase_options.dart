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
    apiKey: 'AIzaSyBcX97zy1q1Z7MILjOW6MWuX6o4wuHKumc',
    appId: '1:276263402653:web:31a34709752d52b1106874',
    messagingSenderId: '276263402653',
    projectId: 'the-sesh-63783',
    authDomain: 'the-sesh-63783.firebaseapp.com',
    storageBucket: 'the-sesh-63783.appspot.com',
    measurementId: 'G-YTED9G899S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrxELWvvMtB-v8Fk50_AO2pr7GNcnAqfg',
    appId: '1:276263402653:android:554bf9bcb5605237106874',
    messagingSenderId: '276263402653',
    projectId: 'the-sesh-63783',
    storageBucket: 'the-sesh-63783.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAm9RhGp5tLBva6S-g2CxrODMklw4V8Cc0',
    appId: '1:276263402653:ios:b15199e46764befd106874',
    messagingSenderId: '276263402653',
    projectId: 'the-sesh-63783',
    storageBucket: 'the-sesh-63783.appspot.com',
    iosClientId: '276263402653-evug35geivlndp2okcp3o9raft7kjdem.apps.googleusercontent.com',
    iosBundleId: 'com.example.climbingSessions',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAm9RhGp5tLBva6S-g2CxrODMklw4V8Cc0',
    appId: '1:276263402653:ios:b15199e46764befd106874',
    messagingSenderId: '276263402653',
    projectId: 'the-sesh-63783',
    storageBucket: 'the-sesh-63783.appspot.com',
    iosClientId: '276263402653-evug35geivlndp2okcp3o9raft7kjdem.apps.googleusercontent.com',
    iosBundleId: 'com.example.climbingSessions',
  );
}