import 'package:flutter/material.dart';

class ModalActionTile extends StatelessWidget {
  const ModalActionTile({
    super.key,
    required this.label,
    required this.action,
    required this.icon,
  });

  final String label;
  final Function() action;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: action,
          ),
          Text(label),
        ],
      ),
    );
  }
}
