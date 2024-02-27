import 'dart:convert';
import 'package:activity2/models/todo.dart';

import 'package:http/http.dart' as http;



 class TodoRespository {
  late http.Client client;
 
  TodoRespository(this.client);
 
  Future<List<Todo>> fetchtodos() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final List body = json.decode(response.body);
         
 
    if (response.statusCode == 200) {
    return body.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}