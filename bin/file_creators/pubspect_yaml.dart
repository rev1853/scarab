import 'dart:io';

import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class PubspecYaml extends FileCreator {
  PubspecYaml(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "pubspec.yaml";

  @override
  Map<String, dynamic>? get replacer => {
        'dartVersion': Platform.version.split(' ')[0],
      };
}
