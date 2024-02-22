import 'package:activity2/models/user.dart';
import 'package:activity2/widgets/more_user_details.dart';
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
                decoration: BoxDecoration(
                    color:const Color.fromARGB(17, 151, 140, 140),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.user.name,
                          style:const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(widget.user.company.name),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
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
                          value:  widget.user.address.city,
                          icon: Icons.location_on),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoItem extends StatefulWidget {
  final String? label;
  final String value;
  final IconData icon;

 const UserInfoItem({super.key, this.label, required this.value, required this.icon});

  @override
  State<UserInfoItem> createState() => _UserInfoItemState();
}

class _UserInfoItemState extends State<UserInfoItem> {

  void _openAddExpenseOverlay() {
    //add icon overlay funtion
    showModalBottomSheet(
      context: context,
       isScrollControlled: true,
      builder: (ctx) => const MoreUserDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            widget.icon,
            size: 25,
            color: const Color.fromARGB(255, 5, 126, 225),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const  SizedBox(height: 4),
                Text(
                  widget.value,
                  style:const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
              icon: const Icon(Icons.arrow_right_sharp), onPressed:(){
                _openAddExpenseOverlay();
              } )
        ],
      ),
    );
  }
}
