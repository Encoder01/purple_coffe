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
    apiKey: 'AIzaSyAqlQ587FWMQcOqeg7WI-EoeRHz5FD5gjg',
    appId: '1:828924547243:web:5a97ea9d58201a1e0ce7ee',
    messagingSenderId: '828924547243',
    projectId: 'alwaystest-6b017',
    authDomain: 'alwaystest-6b017.firebaseapp.com',
    databaseURL: 'https://alwaystest-6b017-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alwaystest-6b017.appspot.com',
    measurementId: 'G-VLKRYWEBNY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-b_RoUe6s0SIjztDAXBK_nhoIpa7X8eg',
    appId: '1:828924547243:android:31c5efdd42fc5cf40ce7ee',
    messagingSenderId: '828924547243',
    projectId: 'alwaystest-6b017',
    databaseURL: 'https://alwaystest-6b017-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alwaystest-6b017.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoVNC_49ULqbmjSMy5LRxd8txOU4Npo6k',
    appId: '1:828924547243:ios:83a248c44734456a0ce7ee',
    messagingSenderId: '828924547243',
    projectId: 'alwaystest-6b017',
    databaseURL: 'https://alwaystest-6b017-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alwaystest-6b017.appspot.com',
    androidClientId: '828924547243-185e879lrm8oh6lmag37io2oefjq5cnj.apps.googleusercontent.com',
    iosClientId: '828924547243-r3br8b5474d6s77uhnuma2ql1vlqul5v.apps.googleusercontent.com',
    iosBundleId: 'com.ttan.purplecoffe.purpleCoffe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoVNC_49ULqbmjSMy5LRxd8txOU4Npo6k',
    appId: '1:828924547243:ios:caa5ed9fe71876d50ce7ee',
    messagingSenderId: '828924547243',
    projectId: 'alwaystest-6b017',
    databaseURL: 'https://alwaystest-6b017-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alwaystest-6b017.appspot.com',
    androidClientId: '828924547243-185e879lrm8oh6lmag37io2oefjq5cnj.apps.googleusercontent.com',
    iosClientId: '828924547243-m2807hushhf2n8efvevjkgv1vpjvgtvb.apps.googleusercontent.com',
    iosBundleId: 'com.ttan.purplecoffe.purpleCoffeMaster',
  );
}
