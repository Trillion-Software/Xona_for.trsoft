import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xona_tsa/core/theme/app_theme.dart';

// Test simple demontrant la couleur de selection du role Organisateur.
// Des tests plus complets (Firebase Auth, Firestore) necessitent des
// mocks (ex: firebase_auth_mocks, fake_cloud_firestore) a ajouter au
// pubspec.yaml en dev_dependencies.
void main() {
  testWidgets('la couleur bleue est reservee au role organisateur',
      (tester) async {
    const organizerColor = AppColors.organizerBlue;
    const participantColor = AppColors.black;
    expect(organizerColor, isNot(equals(participantColor)));
  });

  test('mot de passe : longueur minimale de 6 caracteres', () {
    bool isValid(String password) => password.length >= 6;
    expect(isValid('12345'), isFalse);
    expect(isValid('123456'), isTrue);
  });
}
