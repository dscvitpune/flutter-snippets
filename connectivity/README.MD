# Connectivity

## Usage

### Dependecies

- [data_connection_checker](https://pub.dev/packages/data_connection_checker)
- [connectivity](https://pub.dev/packages/connectivity)
- [provider](https://pub.dev/packages/provider)

### main.dart

```dart
Widget build(BuildContext context) {
  return StreamProvider<ConnectionStatus>.value(
      value: ConnectivityService().connectivityController.stream,
      child: StreamProvider<DataConnectionStatus>.value(
          value: DataConnectionService().dataConnectionStatusController.stream,
          child: MaterialApp()));
}
```

### Iniitilization

```dart
ConnectionStatus connectionStatus;
DataConnectionStatus dataConnectionStatus;
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<
    ScaffoldState>(); //this is optional if you want to use the error snackBar
initializeConnection() {
  connectionStatus = Provider.of<ConnectionStatus>(context);
  dataConnectionStatus = Provider.of<DataConnectionStatus>(context);
}

Widget build(BuildContext context) {
  initializeConnection();
  return Scaffold(key: _scaffoldKey);
}
```

### Example 1 - with snackBar

```dart
if (connectivityHandeler(
  scaffoldKey: _scaffoldKey_,
  connectionStatus: connectionStatus,
  dataConnectionStatus: dataConnectionStatus)){
  //Your function
}
```

### Example 2 - without snackBar

```dart
AnimatedOpacity(
	opacity: connectivityHandeler(
			scaffoldKey: null,
			connectionStatus: connectionStatus,
			dataConnectionStatus: dataConnectionStatus)
		? 1
		: 0.25,
	duration: Duration(milliseconds: 300),
	child:Text("Hii"),
)

```
