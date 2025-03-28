import 'package:api_in_flutter/data/models/user.dart';
import 'package:api_in_flutter/data/repositories/user_repository.dart';
import 'package:api_in_flutter/data/services/api_service.dart';
import 'package:api_in_flutter/data/services/storage_service.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserRepository userRepository;
  List<User> users = [];
  User? savedUser;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    userRepository = UserRepository(
      apiService: ApiService(),
      storageService: StorageService(),
    );
    _loadUsers();
    _loadSavedUser();
  }

  Future<void> _loadUsers() async {
    try {
      List<User> fetchedUsers = await userRepository.getUsers();
      setState(() {
        users = fetchedUsers;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Future<void> _loadSavedUser() async {
    User? user = await userRepository.getSavedUser();
    setState(() {
      savedUser = user;
    });
  }

  void _saveUser(User user) async {
    await userRepository.saveUser(user);
    setState(() {
      savedUser = user;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User Saved: ${user.name}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List & Storage")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (savedUser != null)
              Card(
                child: ListTile(
                  title: Text("Last Saved: ${savedUser!.name}"),
                  subtitle: Text(savedUser!.email),
                ),
              ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : errorMessage.isNotEmpty
                      ? Center(child: Text(errorMessage))
                      : ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return Card(
                              child: ListTile(
                                title: Text(user.name),
                                subtitle: Text(user.email),
                                trailing: IconButton(
                                  icon: const Icon(Icons.save),
                                  onPressed: () => _saveUser(user),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
