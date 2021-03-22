import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/HomeScreen.dart';
import 'package:livel_application/log_in_screens/components/SignInPage.dart';
import 'package:provider/provider.dart';
import 'package:livel_application/log_in_screens/components/authentication_service.dart';

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AuthenticationWrapper(),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    //check if user has logged in
    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SignInPage();
  }
}
