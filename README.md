# Xona TSA

Application mobile Flutter (Android & iOS) permettant aux organisateurs
événementiels de créer, gérer et vendre directement dans l'app des tickets
numériques à des participants.

Éditeur : **Trillion Software**

## Stack technique

- **Flutter / Dart** — génère les applications Android et iOS à partir du
  même code.
- **Firebase** — authentification et backend.
- **Firestore** — base de données (comptes utilisateurs, profils, pays,
  événements, tickets).
- **Firebase Cloud Functions** — pont sécurisé vers l'API WhatsApp Business
  Cloud (aucun secret/token/clé API côté frontend).

## Structure du projet

```
lib/
  main.dart
  screens/
    splash_screen.dart
    connexion_page.dart
    loading_page.dart
    choix_profil_page.dart   (placeholder)
assets/
  images/
    splash_01.png
    connect.jpg
    loadingpage_01.png
```

> Chaque fichier ci-dessus doit être créé dans le repo au chemin exact
> indiqué en commentaire en haut du fichier. Sur GitHub, utilise
> "Add file → Create new file" et tape le chemin complet
> (ex. `lib/screens/splash_screen.dart`) : GitHub crée les dossiers
> automatiquement.

## Dépendances (`pubspec.yaml`)

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.6.0

flutter:
  assets:
    - assets/images/splash_01.png
    - assets/images/connect.jpg
    - assets/images/loadingpage_01.png
```

Ajoute aussi `firebase_options.dart` (généré par `flutterfire configure`)
et connecte le projet Firebase avant de lancer l'app.

## Parcours implémenté jusqu'ici

1. **Splash Screen** (`splash_screen.dart`) — affiche `splash_01.png`
   pendant 1 seconde, puis bascule automatiquement vers la connexion.
2. **Connexion** (`connexion_page.dart`) — formulaire e-mail / mot de
   passe, "Se souvenir de moi", "Mot de passe oublié ?", "Se connecter",
   "Créer un compte". Le bouton "Se connecter" ouvre la page de chargement.
3. **Chargement** (`loading_page.dart`) — affiche `loadingpage_01.png`
   pendant que l'app vérifie les données utilisateur, puis route vers
   la suite du parcours.
4. **Choix du profil** (`choix_profil_page.dart`) — *placeholder*,
   en attente de la maquette (Participant / Organisateur).

## Parcours prévu (à venir)

Politique de confidentialité → Choix du profil (Participant/Organisateur)
→ Choix du pays (obligatoire, une seule fois) → Participant : choix du
type d'événement puis liste des événements ; Organisateur : espace dédié.

Deux flux OTP WhatsApp séparés sont prévus : création de compte et
récupération de mot de passe, tous deux relayés via Firebase Cloud
Functions.

## À faire

- Brancher l'authentification Firebase réelle sur `connexion_page.dart`.
- Construire les pages : Création de compte, Mot de passe oublié,
  Vérification OTP (x2), Nouveau mot de passe, Politique de
  confidentialité, Choix du profil, Choix du pays, Choix du type
  d'événement, Liste des événements, espace Organisateur.
- Générer `firebase_options.dart` avec FlutterFire et connecter le
  projet Firebase.
