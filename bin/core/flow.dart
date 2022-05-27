import 'dart:async';
import 'dart:io';

import '../helper/shell_commands.dart';

abstract class Flow {
  int level;
  Flow({this.level = 0});

  ///
  /// The flow to be executed.
  ///the flow item must have a message, and action key
  ///
  List<Map<String, dynamic>> get flow => [];
  String get prefix => level == 0 ? '[SCARAB]' : '$space=>';
  String get space => List.generate(level * 2, (index) => ' ').join();

  Future run() async {
    await Future.forEach<int>(flow.asMap().keys, runner);
  }

  Future runner(int key) async {
    try {
      String message = '$prefix ' + flow[key]['message'];
      if (flow[key]['action'] is Future Function()) {
        await ShellCommands.showProgressBar(message, flow[key]['action']?.call());
      } else if (flow[key]['action'] is Flow) {
        stdout.write(message);
        stdout.write('\n');
        await flow[key]['action'].run();
      } else if (flow[key]['action'] is Function) {
        await ShellCommands.showProgressBar(message, Future.value(flow[key]['action']?.call()));
      }
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
