import 'package:email_verification/src/authentication_feature/login.dart';
import 'package:email_verification/src/authentication_feature/verify_screen.dart';
import 'package:email_verification/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'authentication_feature/register.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);

                  case RegistrationPage.routeName:
                    return const RegistrationPage();

                  case LoginPage.routeName:
                    return const LoginPage();

                  case VerifyScreen.routeName:
                    return const VerifyScreen();

                  case SampleItemListView.routeName:
                    return const SampleItemListView();
                    
                  default:
                    return const LoginPage();
                }
              },
            );
          },
        );
      },
    );
  }
}