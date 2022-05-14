import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../constant.dart';
import '../helper/file_helper.dart';
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
      String content = (await fetchBase64Content())!;

      File file = await File('${shell.path}\\$filename').create()
        ..writeAsString('');
      List<String> multilineContent = content.split(RegExp(r'\n'));

      List<Uint8List> base64List = multilineContent.map((item) => base64.decode(item)).toList();
      for (var item in base64List) {
        String content = await file.readAsString();
        await file.writeAsBytes(item);
        String content2 = await file.readAsString();
        await file.writeAsString(content + content2);
      }

      String fileContent = await file.readAsString();
      await file.writeAsString(FileHelper.replaceContent(fileContent, defaultReplacer..addAll(replacer ?? {})));
    } catch (err) {
      rethrow;
    }
  }

  Future<String?> fetchBase64Content() async {
    try {
      String filename = this.filename.replaceAll('\\', '/') + '.scarab';
      Uri url = Uri.parse('$GITHUB_RAW_URL/$filename');
      Map<String, String> headers = {
        'Authorization': 'token $GITHUB_TOKEN',
      };
      String response = (await http.get(url, headers: headers)).body;
      return jsonDecode(response)['content'];
    } catch (err) {
      throw '''Cannot read file: $filename, Check your internet connection.''';
    }
  }
}
