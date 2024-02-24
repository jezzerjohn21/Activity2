import 'package:activity2/models/user.dart';
import 'package:activity2/views/todos.dart';
import 'package:activity2/widgets/userinfoitem.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.user});
  final User user;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Text(
                        widget.user.name[0].toUpperCase(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.business_outlined,
                              size: 30,
                            ),
                            Text(widget.user.company.name),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          children: [
                            Text(
                              ' ${widget.user.company.catchPhrase}',
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserInfoItem(
                        label: 'Name',
                        value: widget.user.name,
                        icon: Icons.person),
                    const Divider(),
                    UserInfoItem(
                        label: 'Username',
                        value: widget.user.username,
                        icon: Icons.account_circle),
                    const Divider(),
                    UserInfoItem(
                        label: 'Email',
                        value: widget.user.email,
                        icon: Icons.email),
                    const Divider(),
                    UserInfoItem(
                        label: 'Address',
                        value: widget.user.address.city,
                        icon: Icons.location_on),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              ': ${widget.user.address.street}, ${widget.user.address.suite}, ${widget.user.address.city}, ${widget.user.address.zipcode} Coordinates: ${widget.user.address.geo.lat}, ${widget.user.address.geo.lng}',
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    UserInfoItem(
                        label: 'Phone',
                        value: widget.user.phone,
                        icon: Icons.phone),
                    const Divider(),
                    UserInfoItem(
                        label: 'Website',
                        value: widget.user.website,
                        icon: Icons.web),
                    const Divider(),
                    UserInfoItem(
                        label: 'Company',
                        value: widget.user.company.name,
                        icon: Icons.business),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'BS: ${widget.user.company.bs}',
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const Todos()),
                                ),
                              );
                            },
                            child: const Text('Show todos')),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
