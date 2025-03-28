class User {

  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

// What it does?
// Defines a User class to represent user data.

// Provides a factory constructor to convert JSON data into a User object.

// How it works?
// The app fetches JSON user data from an API.

// The JSON data is converted into User objects using User.fromJson().
