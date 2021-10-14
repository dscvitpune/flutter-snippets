import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  StreamController<ConnectionStatus> connectivityController =
      StreamController<ConnectionStatus>();
  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult status) {
      var _connectionStatus = _networkStatus(status);
      connectivityController.add(_connectionStatus);
    });
  }
  ConnectionStatus _networkStatus(ConnectivityResult status) {
    switch (status) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return ConnectionStatus.online;
      case ConnectivityResult.none:
      default:
        return ConnectionStatus.offline;
    }
  }
}

Future<ConnectionStatus> lookup() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return ConnectionStatus.online;
    } else {
      return ConnectionStatus.offline;
    }
  } on SocketException catch (_) {
    return ConnectionStatus.offline;
  }
}

enum ConnectionStatus {
  online,
  offline,
}
