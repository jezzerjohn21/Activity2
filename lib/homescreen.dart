import 'package:activity2/models/user.dart';
import 'package:activity2/views/user_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<User>> postsFuture = getUsers();

  static Future<List<User>> getUsers() async {
    var url = Uri.parse("http://10.0.2.2:3001/faker");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => User.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<User>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return UserItemList(users: users);
          } else {
            return const Text("No data available");
          }
        },
      ),
    );
  }
}

