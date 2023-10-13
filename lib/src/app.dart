import 'package:flutter/material.dart';

import 'login/views/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        restorationScopeId: 'app',
        theme: ThemeData.dark(useMaterial3: true),
        home: const LoginView());
  }
}
