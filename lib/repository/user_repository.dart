import 'dart:convert';
import 'package:activity2/models/user.dart';
import 'package:http/http.dart' as http;



 class UserRespository {
  late http.Client client;
 
  UserRespository(this.client);
 
  Future<List<User>> fetchUser() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final List body = json.decode(response.body);
         
 
    if (response.statusCode == 200) {
    return body.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}