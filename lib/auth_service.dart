import 'storage_repository.dart';

class AuthService {
  final StorageRepository storage;

  AuthService(this.storage);

  Future<String?> register(String email, String password) async {
    if (!_validateEmail(email)) return 'Invalid email format';
    if (!_validatePassword(password)) return 'Password must be at least 6 characters';

    await storage.saveUserData(email, password);
    return null; // реєстрація успішна
  }

  Future<String?> login(String email, String password) async {
    final storedData = await storage.getUserData();
    if (storedData == null) return 'User not found';
    if (storedData['email'] == email && storedData['password'] == password) {
      return null; // логін успішний
    }
    return 'Incorrect email or password';
  }

  Future<void> logout() async {
    await storage.clearUserData(); // очищаємо дані користувача при виході
  }

  bool _validateEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }
}
