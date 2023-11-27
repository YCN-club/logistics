import 'package:flutter/material.dart';
import 'package:mitblr_club_app/src/login/controllers/login_controller.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key, required this.loginController});

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Text('Logout'),
      content: const Text('Yo bruh you sure you wanna logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            loginController.logout(context);
          },
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
