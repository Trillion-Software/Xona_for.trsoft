// Emplacement dans le repo : lib/screens/loading_page.dart
import 'package:flutter/material.dart';
import 'choix_profil_page.dart';

/// Page affichée juste après la connexion, le temps que l'app
/// vérifie/prépare les données de l'utilisateur (profil, pays, etc.)
/// avant de router vers la suite du parcours.
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    _preparerSuite();
  }

  Future<void> _preparerSuite() async {
    // TODO: remplacer ce délai par la vraie logique :
    // - vérifier dans Firestore si l'utilisateur a déjà un profil
    //   (Participant / Organisateur) et un pays enregistrés
    // - si oui, router directement vers l'espace correspondant
    // - sinon, router vers la page de choix de profil (ci-dessous)
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ChoixProfilPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/loadingpage_01.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
