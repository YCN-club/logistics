import 'package:flutter/material.dart';

import 'settings/controllers/settings_controller.dart';
import 'settings/views/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            restorationScopeId: 'app',
            theme: ThemeData(useMaterial3: true),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            home: SettingsView(controller: settingsController));
      },
    );
  }
}
