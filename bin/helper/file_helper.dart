import 'dart:convert';
import 'dart:io';

class FileHelper {
  static String replaceContent(String content, Map<String, dynamic> replacer) {
    for (var key in replacer.keys) {
      content = content.replaceAll('<<$key>>', replacer[key].toString());
    }
    return content;
  }

  static Future<Map<String, dynamic>> get scarabJson async {
    var scarabJson = await File(Directory.current.absolute.path + '\\scarab.json').readAsString();
    return jsonDecode(scarabJson);
  }
}
