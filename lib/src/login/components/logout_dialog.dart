import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text('Logout'),
      ),
      content: const Text('Are you sure that you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
