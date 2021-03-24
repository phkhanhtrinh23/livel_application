import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';
import 'package:livel_application/log_in_screens/components/sign_in.dart';
import 'package:livel_application/log_in_screens/components/set_profile.dart';
import 'package:livel_application/splash_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:livel_application/log_in_screens/components/authentication.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: Scaffold(
        body: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SecondScreen();
  }
}
