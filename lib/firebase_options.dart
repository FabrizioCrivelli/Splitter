import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
        return windows;
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
    apiKey: 'AIzaSyAwHYG89x9zn4Adg_E3DpxSLVwTZXeqfiQ',
    appId: '1:977980943339:web:940eb176ad9bb1d69287ae',
    messagingSenderId: '977980943339',
    projectId: 'splitear-app',
    authDomain: 'splitear-app.firebaseapp.com',
    storageBucket: 'splitear-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWb-BvjrEUcu5bssmRr0ErUzxpa3_6FCo',
    appId: '1:977980943339:android:6e573a6b64bbfd2b9287ae',
    messagingSenderId: '977980943339',
    projectId: 'splitear-app',
    storageBucket: 'splitear-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0KFKwU7Te8axKqdTLxrqWItEc9xvHRZs',
    appId: '1:977980943339:ios:3e7ed4a83ab48aa59287ae',
    messagingSenderId: '977980943339',
    projectId: 'splitear-app',
    storageBucket: 'splitear-app.firebasestorage.app',
    iosBundleId: 'com.example.splitearApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0KFKwU7Te8axKqdTLxrqWItEc9xvHRZs',
    appId: '1:977980943339:ios:3e7ed4a83ab48aa59287ae',
    messagingSenderId: '977980943339',
    projectId: 'splitear-app',
    storageBucket: 'splitear-app.firebasestorage.app',
    iosBundleId: 'com.example.splitearApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwHYG89x9zn4Adg_E3DpxSLVwTZXeqfiQ',
    appId: '1:977980943339:web:8da63daee64d773f9287ae',
    messagingSenderId: '977980943339',
    projectId: 'splitear-app',
    authDomain: 'splitear-app.firebaseapp.com',
    storageBucket: 'splitear-app.firebasestorage.app',
  );
}
