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
    return JsonEncoder.withIndent('  ').convert({
      'name': projectName,
      'version': '0.0.1',
      'description': '',
      'author': '',
      'license': '',
    });
  }
}
