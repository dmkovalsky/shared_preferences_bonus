import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_bonus/data/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  @override
  Future<String> getUsername() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('username') ?? '';
  }

  @override
  Future<void> saveUsername(String username) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', username);
  }
}
