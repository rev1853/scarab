import 'dart:io';

import 'package:process_run/shell.dart';

class ShellCommands {
  Shell _shell = Shell(
    verbose: false,
  );

  String get path => _shell.path;

  Future createDirectory(String path) async {
    return await run('mkdir $path');
  }

  Future flutterCreate(String filename) async {
    return await run(CommandList.flutterCreate(filename));
  }

  Future flutterPubGet() async {
    return await run(CommandList.flutterPubGet());
  }

  Future deleteFile(String path) async {
    return await run('rm $path');
  }

  void cd(String path) {
    _shell = _shell.pushd(path);
  }

  Future run(String command) {
    return _shell.run(command);
  }

  static echo(String message) {
    stdout.write('\x1B[35m$message\x1b[0m');
  }

  static Future showProgressBar(String title, Future command) async {
    bool isDone = false;
    while (!isDone) {
      command.then((_) {
        isDone = true;
      });
      for (int i = 0; i <= 8; i++) {
        _drawBar(title, i);
        await Future.delayed(const Duration(milliseconds: 50));
      }
    }
    _drawBar(title, -1);
    stdout.write('\n');
  }

  static void _drawBar(String title, int index) {
    String indicator = _drawIndicator(index);
    stdout.write(
      '\r$title $indicator',
    );
  }

  static String _drawIndicator(int index) {
    String prefix = '\x1b[38;5;75;51m';
    String suffix = '\x1b[0m';
    String code = '✓';
    if (index % 4 == 0) {
      code = '-';
    } else if ([1, 5].contains(index)) {
      code = '/';
    } else if ([2, 6].contains(index)) {
      code = '|';
    } else if ([3, 7].contains(index)) {
      code = '/';
    } else {
      code = 'complete';
      prefix = '\x1b[32;5;75;51m';
    }
    return "$prefix[$code] $suffix";
  }
}

class CommandList {
  static String flutterCreate(String filename) {
    return 'flutter create $filename';
  }

  static String flutterPubGet() {
    return 'flutter pub get';
  }

  static String cd(String path) {
    return 'cd $path';
  }
}
