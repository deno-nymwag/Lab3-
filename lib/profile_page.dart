import 'package:flutter/material.dart';
import 'storage_service.dart';

class ProfilePage extends StatelessWidget {
  final StorageService storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    final user = storageService.getUser();

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Email: ${user.email}'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await storageService.logout();
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
