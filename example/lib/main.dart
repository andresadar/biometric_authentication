import 'package:flutter/material.dart';
import 'package:biometric_authentication/biometric/biometric.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Auth Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Biometric Auth Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BiometricAuth _biometricAuth = BiometricAuth();

  Future<void> _signInWithBiometrics() async {
    bool isAuthenticated = false;
    bool isBiometricAvailable = await _biometricAuth.isBiometricAvailable();

    if (isBiometricAvailable) {
      isAuthenticated = await _biometricAuth.authenticateWithBiometrics('Please authenticate to continue');
    }

    if (isAuthenticated) {
      // Sign in and navigate to the next screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication successful!')),
      );
    } else {
      // Show an error message or perform another action in case of failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication failed!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformElevatedButton(
                onPressed: _signInWithBiometrics,
                child: const Text('Sign in with Fingerprint / Face ID'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}