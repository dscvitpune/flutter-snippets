import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

bool connectivityHandeler({
  GlobalKey<ScaffoldState> scaffoldKey,
  @required ConnectionStatus connectionStatus,
  @required DataConnectionStatus dataConnectionStatus,
}) {
  if (dataConnectionStatus == DataConnectionStatus.connected &&
      connectionStatus == ConnectionStatus.online) {
    return true;
  } else {
    if (scaffoldKey != null) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("No Internet connection"),
        backgroundColor: Colors.red,
      ));
    }
    return false;
  }
}
