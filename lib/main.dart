import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'shared_preferences_repository.dart';
import 'registration_page.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService authService = AuthService(SharedPreferencesRepository());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => RegistrationPage(authService: authService),
        '/home': (context) => HomePage(authService: authService),
        '/login': (context) => LoginPage(authService: authService),
      },
      initialRoute: '/',
    );
  }
}
