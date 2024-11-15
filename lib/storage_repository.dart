// storage_repository.dart

abstract class StorageRepository {
  Future<void> saveUserData(String email, String password);
  Future<Map<String, String>?> getUserData();
  Future<void> clearUserData();
}
