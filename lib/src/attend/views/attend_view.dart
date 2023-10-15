import 'package:flutter/material.dart';
import 'package:mitblr_club_app/src/login/views/login_view.dart';

class AttendView extends StatelessWidget {
  const AttendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/logo.png',
          width: 160,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging Out...')),
                );
                await Future.delayed(const Duration(seconds: 3));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
