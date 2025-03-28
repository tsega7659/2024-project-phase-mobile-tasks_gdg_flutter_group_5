import 'dart:convert';
import 'package:http/http.dart' as http;
import "../models/user.dart";


class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async{
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200){
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      }else{
        throw Exception('Failed to load users');
      }
    } catch(e){
      throw Exception('Failed to load users');
    }
  }
}






// What it does?
// Fetches user data from the API (https://jsonplaceholder.typicode.com/users).

// Converts the response into a list of User objects.

// How it works?
// Uses the http package to make a GET request.

// If the request is successful (statusCode == 200), it decodes the JSON response and maps it into a list of User objects.

// If the request fails, it throws an error.