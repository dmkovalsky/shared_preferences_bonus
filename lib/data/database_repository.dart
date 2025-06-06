abstract class DatabaseRepository {
  Future<String> getUsername();
  Future<void> saveUsername(String username);
}
