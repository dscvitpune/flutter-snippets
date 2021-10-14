import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';

class DataConnectionService {
  StreamController<DataConnectionStatus> dataConnectionStatusController =
      StreamController<DataConnectionStatus>();
  DataConnectionService() {
    DataConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
      dataConnectionStatusController.add(dataConnectionStatus);
    });
  }
}
