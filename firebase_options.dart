// PLACEHOLDER GENERE MANUELLEMENT - A REMPLACER
//
// Ce fichier doit normalement etre genere automatiquement par la
// FlutterFire CLI :
//
//   dart pub global activate flutterfire_cli
//   flutterfire configure
//
// Cette commande se connecte a votre vrai projet Firebase et regenere
// ce fichier avec vos identifiants reels (apiKey, appId, projectId...).
// Voir le README.md, section "Configuration Firebase", pour la marche
// a suivre complete.
//
// NE COMMITEZ JAMAIS de vraies cles secretes cote serveur dans ce
// fichier : les valeurs ci-dessous pour Android/iOS sont des
// identifiants client publics (normal pour Firebase), mais restent
// ici des PLACEHOLDERS non fonctionnels tant que vous n'avez pas
// lance `flutterfire configure`.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Xona TSA ne cible pas le web pour le moment.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions ne sont pas configurees pour cette plateforme.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'PLACEHOLDER_ANDROID_API_KEY',
    appId: 'PLACEHOLDER_ANDROID_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'PLACEHOLDER_PROJECT_ID',
    storageBucket: 'PLACEHOLDER_PROJECT_ID.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'PLACEHOLDER_IOS_API_KEY',
    appId: 'PLACEHOLDER_IOS_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'PLACEHOLDER_PROJECT_ID',
    storageBucket: 'PLACEHOLDER_PROJECT_ID.appspot.com',
    iosBundleId: 'com.xonatsa.app',
  );
}
