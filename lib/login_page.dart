import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginPage extends StatelessWidget {
  final AuthService authService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Отримуємо введені email та password
                final email = emailController.text;
                final password = passwordController.text;

                // Викликаємо метод `login` з AuthService
                final loginResult = await authService.login(email, password);

                if (loginResult == null) {
                  // Логін успішний, перенаправляємо на головну сторінку
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Показуємо повідомлення про помилку
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(loginResult)),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
