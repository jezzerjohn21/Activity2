import 'dart:convert';

import 'package:activity2/models/todo.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: TodoContent(),
      )),
    );
  }
}

class TodoContent extends StatefulWidget {
  const TodoContent({
    super.key,
  });

  @override
  State<TodoContent> createState() => _TodoContentState();
}

class _TodoContentState extends State<TodoContent> {
  late Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();

    todos = getTodos();
  }

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3001/todos'),
        headers: {"Content-Type": "application/json"});
    final List<dynamic> todosAPI = jsonDecode(response.body);
    return todosAPI.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final todo = snapshot.data![index];
                return ListTile(
                  title: Text(' ${todo.title}'),
                  trailing: Checkbox(
                      value: todo.isFinished, onChanged: (bool? newValue) {}),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
