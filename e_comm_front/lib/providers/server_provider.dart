import 'package:flutter/foundation.dart';

enum UseServer { usePython, useNode }
const dServerName = 'localhost';
const dPythonServerPort = 5000;
const dNodeServerPort = 3000;

class ServerProvider extends ChangeNotifier {
  UseServer _server = UseServer.useNode;
  late Uri _serverUrl;
  ServerProvider() {
    _serverUrl = Uri(
      host: dServerName,
      port:
          _server == UseServer.usePython ? dPythonServerPort : dNodeServerPort,
    );
  }
  void changeToPythonServer() {
    _server = UseServer.usePython;
    _serverUrl = Uri(host: dServerName, port: dPythonServerPort);
    notifyListeners();
  }

  void changeToNodeServer() {
    _server = UseServer.useNode;
    _serverUrl = Uri(host: dServerName, port: dNodeServerPort);
    notifyListeners();
  }

  UseServer get getHostType => _server;
  Uri get getUri => _serverUrl;
}
