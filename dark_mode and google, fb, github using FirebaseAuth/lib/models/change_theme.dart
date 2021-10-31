import 'package:flutter/widgets.dart';

class ChangeTheme extends ChangeNotifier {
  bool isDarkTheme = false;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
