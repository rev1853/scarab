import 'dart:async';
import 'dart:io';

import '../constant.dart';
import '../helper/shell_commands.dart';
import 'package:http/http.dart' as http;

abstract class FileCreator {
  FileCreator(
    this.shell,
  );

  final ShellCommands shell;
  String get filename;
  Map<String, dynamic>? get replacer;
  late Map<String, dynamic> defaultReplacer = {
    'projectName': projectName,
  };

  String get projectName => shell.path.split('\\').last;

  Future create() async {
    try {
      return await File('${shell.path}\\$filename').writeAsString(
        (await _readFile(
          defaultReplacer..addAll(replacer ?? {}),
        ))!,
      );
    } catch (err) {
      rethrow;
    }
  }

  Future<String?> _readFile(Map<String, dynamic> replacer) async {
    try {
      Uri url = Uri.parse('$GITHUB_RAW_URL/$filename.scarab');
      String content = (await http.get(url)).body;
      replacer.forEach((key, value) {
        content = content.replaceAll('<<$key>>', value);
      });
      return content;
    } catch (err) {
      throw '''Cannot read file: $filename, Check your internet connection.''';
    }
  }
}
