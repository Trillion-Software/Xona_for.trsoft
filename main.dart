import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // L'initialisation Firebase est egalement lancee depuis la page de
  // Loading (voir splash_page.dart) afin d'afficher une animation
  // pendant ce chargement ; on l'amorce ici pour eviter tout retard
  // si le splash est reconstruit rapidement.
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (_) {
    // Si Firebase est deja initialise ou si les options placeholders
    // ne sont pas encore configurees, on laisse la SplashPage gerer
    // et afficher un etat d'erreur clair a l'utilisateur.
  }

  runApp(const XonaTsaApp());
}
