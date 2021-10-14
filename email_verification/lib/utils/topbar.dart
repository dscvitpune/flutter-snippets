import 'package:flutter/material.dart';
import '../src/settings/settings_view.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key, required Widget title, required BuildContext context})
      : super(
          key: key,
          title: title,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        );
}
