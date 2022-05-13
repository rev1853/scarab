import 'package:process_run/shell.dart';

class ShellCommands {
  Shell _shell = Shell();

  String get path => _shell.path;

  Future createDirectory(String path) async {
    await _shell.run('md $path');
  }

  Future flutterCreate(String filename) async {
    return await _shell.run(CommandList.flutterCreate(filename));
  }

  Future flutterPubGet(String dependency) async {
    return await _shell.run(CommandList.flutterPubGet(dependency));
  }

  void cd(String path) {
    _shell = _shell.pushd(path);
  }
}

class CommandList {
  static String flutterCreate(String filename) {
    return 'flutter create $filename';
  }

  static String flutterPubGet(String dependency) {
    return 'flutter pub add $dependency';
  }

  static String cd(String path) {
    return 'cd $path';
  }
}
