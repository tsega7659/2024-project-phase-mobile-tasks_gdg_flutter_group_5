import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

class UserRepository {
  final ApiService apiService;
  final StorageService storageService;

  UserRepository({required this.apiService, required this.storageService});

  Future<List<User>> getUsers() async {
    return await apiService.fetchUsers();
  }

  Future<void> saveUser(User user) async {
    await storageService.saveUser(user);
  }

  Future<User?> getSavedUser() async {
    return await storageService.getSavedUser();
  }
}




// What it does?
// Acts as a middle layer between UI (HomeScreen) and data sources (ApiService & StorageService).

// Fetches users from the API.

// Saves and retrieves a user using StorageService.

// How it works?
// It initializes ApiService and StorageService.

// Provides methods to get users from the API, save a user, and retrieve a saved user.