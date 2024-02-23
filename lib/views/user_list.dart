import 'package:activity2/views/user_details.dart';
import 'package:flutter/material.dart';
import 'package:activity2/models/user.dart';

class UserItemList extends StatelessWidget {
  const UserItemList({super.key, required this.users});
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final post = users[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetails(user: post)));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(
                Icons.person,
                size: 30,
              ),
              title: Text(post.name),
              trailing: Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.symmetric(vertical: 0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                 
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
