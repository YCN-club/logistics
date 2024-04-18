import 'package:flutter/material.dart';

import 'package:logistics/src/login/views/login_view.dart';
import 'package:logistics/themes.dart';

class Logistics extends StatelessWidget {
  const Logistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LoginView(),
    );
  }
}
