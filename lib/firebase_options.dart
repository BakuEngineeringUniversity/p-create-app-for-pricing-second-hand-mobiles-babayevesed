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
    apiKey: 'AIzaSyDUS2OLLccuqg4dcxHQPpn4EXSaV3lOll0',
    appId: '1:486632270473:web:1cecf60f6fdd363bcc3458',
    messagingSenderId: '486632270473',
    projectId: 'telephonchu',
    authDomain: 'telephonchu.firebaseapp.com',
    storageBucket: 'telephonchu.appspot.com',
    measurementId: 'G-V7WPQGGDKX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6Scp1j2XNgjV_AIwTyX14y9mpxf1W6fc',
    appId: '1:486632270473:android:745afeebaa8610eccc3458',
    messagingSenderId: '486632270473',
    projectId: 'telephonchu',
    storageBucket: 'telephonchu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCobrumP0ftVZX35L7q2Ci5xRidf2A-r5c',
    appId: '1:486632270473:ios:8e84020d80e2a582cc3458',
    messagingSenderId: '486632270473',
    projectId: 'telephonchu',
    storageBucket: 'telephonchu.appspot.com',
    androidClientId: '486632270473-2t4eqi432u32rlr1naih4isacnu15nmc.apps.googleusercontent.com',
    iosClientId: '486632270473-iqh6qecnmmcudnbeicf3gh2poifhvjpl.apps.googleusercontent.com',
    iosBundleId: 'com.chaysoft.telefonchu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCobrumP0ftVZX35L7q2Ci5xRidf2A-r5c',
    appId: '1:486632270473:ios:8e84020d80e2a582cc3458',
    messagingSenderId: '486632270473',
    projectId: 'telephonchu',
    storageBucket: 'telephonchu.appspot.com',
    androidClientId: '486632270473-2t4eqi432u32rlr1naih4isacnu15nmc.apps.googleusercontent.com',
    iosClientId: '486632270473-iqh6qecnmmcudnbeicf3gh2poifhvjpl.apps.googleusercontent.com',
    iosBundleId: 'com.chaysoft.telefonchu',
  );
}
