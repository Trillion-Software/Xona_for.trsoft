# Xona TSA : Application Flutter

Application mobile Xona TSA : decouverte, creation et gestion d'evenements,
billetterie numerique (Participant / Organisateur evenementiel).

> **Etat de ce livrable.** Ce depot contient une base Flutter fonctionnelle
> et le squelette d'architecture demande (Loading → Demarrage →
> Authentification → Conditions → Selection du role → Parametres), avec
> Firebase Authentication, Firestore et le systeme de feedback tactile
> global deja implementes.
>
> **Les dossiers natifs `android/` et `ios/` ne sont PAS inclus.**
> Ils doivent etre generes localement par la commande `flutter create .`
> (etape 1 ci-dessous) car ce sont des fichiers volumineux, generes par
> outillage (Gradle, Xcode/CocoaPods...), qu'il n'est pas fiable de
> reconstruire a la main sans le SDK Flutter pour les valider. La commande
> les regenere en 30 secondes sur votre machine, sans toucher au dossier
> `lib/` deja fourni.

---

## 1. Installation de Flutter

1. Installez le SDK Flutter : https://docs.flutter.dev/get-started/install
2. Verifiez l'installation :
   ```bash
   flutter doctor
   ```

## 2. Recuperer ce projet et generer les dossiers natifs

```bash
cd xona_tsa
flutter create . --project-name xona_tsa --org com.xonatsa
```

Cette commande cree `android/` et `ios/` sans ecraser `lib/`, `pubspec.yaml`
ni les autres fichiers deja presents.

## 3. Installer les dependances

```bash
flutter pub get
```

## 4. Configuration Firebase

1. Creez un projet sur https://console.firebase.google.com
2. Installez la FlutterFire CLI :
   ```bash
   dart pub global activate flutterfire_cli
   ```
3. Connectez le projet :
   ```bash
   flutterfire configure
   ```
   Cette commande remplace automatiquement le fichier placeholder
   `lib/firebase_options.dart` par vos vraies cles, et telecharge :
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

   Ces deux fichiers sont volontairement absents de ce depot et listes
   dans `.gitignore` : ne les committez jamais publiquement.

## 5. Activer Firebase Authentication

Dans la console Firebase → **Authentication → Sign-in method**, activez :
- **E-mail/Mot de passe**
- **Google**

## 6. Configuration Google Sign-In

- Android : renseignez le SHA-1 (et SHA-256) de votre certificat de debug
  et de release dans la console Firebase (Parametres du projet → vos apps
  Android).
- iOS : ajoutez le `REVERSED_CLIENT_ID` (present dans
  `GoogleService-Info.plist`) comme URL Scheme dans Xcode
  (Runner → Info → URL Types).

## 7. Configuration Firestore

1. Console Firebase → **Firestore Database** → Creer la base (mode production).
2. Deployez les regles de securite fournies :
   ```bash
   firebase deploy --only firestore:rules
   ```
   (le fichier `firestore.rules` est a la racine du projet ; necessite
   `firebase-tools` : `npm install -g firebase-tools`, puis `firebase init`
   pour lier le projet si ce n'est pas deja fait).

Collections prevues : `users`, `events`, `tickets`, `orders`, `organizers`,
`participants`, `app_settings`, `legal_documents`.

## 8. Lancer sur Android

```bash
flutter run
```

## 9. Preparation iOS

```bash
cd ios && pod install && cd ..
flutter run
```
(necessite un Mac avec Xcode installe).

## 10. Remplacement des placeholders Firebase

Apres `flutterfire configure` (etape 4), verifiez que
`lib/firebase_options.dart` ne contient plus les valeurs
`PLACEHOLDER_...` mais vos vraies valeurs `apiKey`, `appId`, etc.

## 11. Generer un APK / AAB (Android)

```bash
flutter build apk --release
# ou pour le Play Store :
flutter build appbundle --release
```

## 12. Generer un build iOS

```bash
flutter build ios --release
```
Puis archivez via Xcode pour publier sur l'App Store.

---

## Architecture du projet

```
lib/
  main.dart                 # point d'entree, init Firebase
  firebase_options.dart     # PLACEHOLDER, regenere par flutterfire configure
  app/
    app.dart                # MaterialApp, theme, routes
    app_router.dart         # noms de routes
  core/
    theme/app_theme.dart    # couleurs (noir/blanc + bleu organisateur), ThemeData
    widgets/touch_ripple.dart  # systeme global de feedback tactile (ripple)
  models/
    app_user.dart
    user_role.dart
  services/
    auth_service.dart       # Firebase Authentication (email, Google, reset)
    user_repository.dart    # lecture/ecriture Firestore collection `users`
  features/
    onboarding/
      splash_page.dart      # Page 1, Loading
      start_page.dart       # Page de demarrage
    authentication/
      login_page.dart
      signup_page.dart
      forgot_password_page.dart
      terms_page.dart       # Conditions d'utilisation (acceptation obligatoire)
    role_selection/
      role_selection_page.dart  # Participant / Organisateur (bleu si selectionne)
    settings/
      settings_page.dart
test/
  role_selection_test.dart
firestore.rules
```

## Ce qui reste a construire

Conformement au principe « ne pas inventer de fonctionnalites metier non
demandees », les ecrans suivants ne sont pas encore implementes et
peuvent etre ajoutes dans les memes dossiers `features/` :
- Tableau de bord Organisateur (creation/gestion d'evenements)
- Decouverte d'evenements et achat de billets (Participant)
- Modeles `Event`, `Ticket`, `Order` et repositories associes

L'architecture (routes, services, theme, systeme de ripple) est prevue
pour accueillir ces ecrans sans refonte.
