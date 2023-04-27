# Biometric Authentication

A Flutter package for biometric authentication (fingerprint, Face ID, and Touch ID).

## Features

* Check if biometric authentication is available on the device
* Authenticate using available biometric methods (fingerprint, Face ID, or Touch ID)
* Retrieve a list of available biometric types
* Cross-platform support for both Android and iOS

## Getting started

To start using the package, follow these steps:

1. Add the package to your `pubspec.yaml` file.
2. Import the package in your Dart file.
3. Create an instance of the `BiometricAuth` class.
4. Implement the sign-in method.
5. Call the `signInWithBiometrics()` function.

## Usage

Here's a short example of how to use the `biometric_authentication` package in your Flutter app:

Import the package in your Dart file:

import 'package:biometric_authentication/biometric_auth.dart';

Create an instance of the `BiometricAuth` class:

final BiometricAuth _biometricAuth = BiometricAuth();

Implement the sign-in method:

```dart
Future<bool> signInWithBiometrics() async {
  bool isAuthenticated = false;
  bool isBiometricAvailable = await _biometricAuth.isBiometricAvailable();

  if (isBiometricAvailable) {
    isAuthenticated = await _biometricAuth.authenticateWithBiometrics('Please authenticate to continue');
  }

  return isAuthenticated;
}
```

Call the `signInWithBiometrics()` function:

```dart
ElevatedButton(
  onPressed: () async {
    bool isAuthenticated = await signInWithBiometrics();
    if (isAuthenticated) {
      // Sign in and navigate to the next screenx
    } else {
      // Show an error message or perform another action in case of failure
    }
  },
  child: Text('Sign in with Fingerprint / Face ID'),
);
```

For more examples, check the `/example` folder in the package repository.

## Additional information

To find more information about the package, contribute to the package, or file issues, visit the package's GitHub repository. You can expect timely responses from the package authors and maintainers.

For a complete API reference, check the [package documentation](https://pub.dev/documentation/biometric_authentication/latest/).

To contribute to the project, feel free to submit a pull request or open an issue on the [GitHub repository](https://github.com/andresadar/biometric_authentication).