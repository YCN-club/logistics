import 'package:flutter/material.dart';
import 'package:mitblr_club_app/src/events/views/events_view.dart';
import 'package:mitblr_club_app/src/login/services/login_service.dart';
import 'package:mitblr_club_app/src/login/views/login_view.dart';

class LoginController {
  LoginService _loginService = LoginService();

  void login(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logging In...')),
    );

    Future.delayed(Duration(seconds: 3)).then((value) => {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => EventsView(),
            ),
          )
        });
  }

  void logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
