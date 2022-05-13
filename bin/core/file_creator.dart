import 'dart:io';

import '../helper/shell_commands.dart';

abstract class FileCreator {
  FileCreator(
    this.shell,
  );

  final ShellCommands shell;
  String get filename;
  String get content;

  Future create() async {
    return await File('${shell.path}\\$filename').writeAsString(content);
  }

  String readFile(String filename, {Map<String, dynamic>? replacer}) {
    String content = File(Directory.current.absolute.path + '/' + filename).readAsStringSync();
    if (replacer != null) {
      replacer.forEach((key, value) {
        content = content.replaceAll('{{$key}}', value);
      });
    }
    return content;
  }
}
