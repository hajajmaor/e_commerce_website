import 'package:flutter/foundation.dart';

enum UseServer { usePython, useNode }
const dServerName = 'localhost';
const dPythonServerPort = 5000;
const dNodeServerPort = 3000;

class ServerProvider extends ChangeNotifier {
  UseServer _server = UseServer.usePython;
  Uri _serverUrl = Uri(host: dServerName, port: dPythonServerPort);

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
