import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:e_comm_front/main.dart' show serverProvider;
import 'package:e_comm_front/providers/server_provider.dart' show UseServer;

class ToggleBackend extends ConsumerWidget {
  const ToggleBackend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _serverProvider = watch(serverProvider);
    return ToggleSwitch(
      activeBgColors: [Colors.yellow, Colors.lime],
      minWidth: 100.0,
      initialLabelIndex:
          _serverProvider.getHostType == UseServer.usePython ? 0 : 1,
      cornerRadius: 20.0,
      labels: const ['Python', 'NodeJs'],
      icons: [
        FontAwesomeIcons.python,
        FontAwesomeIcons.nodeJs,
      ],
      onToggle: (index) {
        if (index == 0) {
          _serverProvider.changeToPythonServer();
        } else {
          _serverProvider.changeToNodeServer();
        }
      },
    );
  }
}
