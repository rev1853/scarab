import 'dart:convert';

import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ScarabJson extends FileCreator {
  ScarabJson(
    ShellCommands shell,
  ) : super(shell);

  String get projectName => shell.path.split('\\').last;

  @override
  String get filename => "scarab.json";

  @override
  String get content {
    return readFile('scarab_json.dart', replacer: {'projectName': projectName});
  }
}
