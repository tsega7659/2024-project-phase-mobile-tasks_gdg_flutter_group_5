
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class StorageService {
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_name', user.name);
    await prefs.setString('saved_email', user.email);
  }

  Future<User?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('saved_name');
    final email = prefs.getString('saved_email');

    if (name != null && email != null) {
      return User(id: 0, name: name, email: email);
    }
    return null;
  }
}




// //What it does?
// Saves and retrieves a user’s details (name & email) using SharedPreferences.

// How it works?
// saveUser(User user): Stores the user’s name and email in shared preferences.

// getSavedUser(): Retrieves the last saved user (if any) from shared preferences.