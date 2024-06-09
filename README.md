# Flutter Firebase Auth App

This is a Flutter application that demonstrates the use of Firebase Authentication and Firestore. The app uses the `firebase_ui_auth` package for authentication UI and Firebase Firestore to store, update, and delete user profile data.

## Features

- User Authentication (Sign-in, Sign-up, and Sign-out) using Firebase Authentication.
- Profile screen displaying fake data.
- CRUD operations (Create, Read, Update, Delete) on Firestore.

## Getting Started

### Prerequisites

- Flutter SDK: [Installation guide](https://flutter.dev/docs/get-started/install)
- Firebase Project: [Setup guide](https://firebase.google.com/docs/flutter/setup)

### Firebase Setup

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Add an Android app and/or iOS app to your Firebase project.
3. Download the `google-services.json` (for Android) and/or `GoogleService-Info.plist` (for iOS) and place them in the appropriate directories.
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`
4. Enable Email/Password sign-in method in the Firebase Authentication section.
5. Set up Firestore in your Firebase project.

### Project Setup

1. Clone the repository:

```sh
git clone https://github.com/your_username/flutter_firebase_auth_app.git
cd flutter_firebase_auth_app
