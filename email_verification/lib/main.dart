import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Initializing widgets Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing the Firebase application
  await Firebase.initializeApp();

  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  runApp(MyApp(settingsController: settingsController));
}
