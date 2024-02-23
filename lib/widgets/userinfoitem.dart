
import 'package:activity2/widgets/more_user_details.dart';
import 'package:flutter/material.dart';

class UserInfoItem extends StatefulWidget {
  final String? label;
  final String value;
  final IconData icon;

  const UserInfoItem(
      {super.key, this.label, required this.value, required this.icon});

  @override
  State<UserInfoItem> createState() => _UserInfoItemState();
}

class _UserInfoItemState extends State<UserInfoItem> {
  void _openAddExpenseOverlay() {
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
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label!,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.value,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
              icon: const Icon(Icons.arrow_right_sharp),
              onPressed: () {
                _openAddExpenseOverlay();
              })
        ],
      ),
    );
  }
}

