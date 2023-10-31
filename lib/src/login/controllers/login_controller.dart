import 'package:flutter/material.dart';
import 'package:mitblr_club_app/src/events/views/events_view.dart';
import 'package:mitblr_club_app/src/login/services/login_service.dart';

class LoginController {
  LoginService _loginService = LoginService();

  void login(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logging In...')),
    );
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EventsView(),
        ),
      );
    }
  }
}
