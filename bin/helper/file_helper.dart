import 'dart:convert';
import 'dart:io';

class FileHelper {
  static String replaceContent(String content, Map<String, dynamic> replacer) {
    for (var key in replacer.keys) {
      content = content.replaceAll('<<$key>>', replacer[key].toString());
    }
    return content;
  }

  static Map<String, dynamic>? get scarabJson {
    final scarabJson = File('scarab.json');
    if (!scarabJson.existsSync()) {
      return null;
    }
    return jsonDecode(scarabJson.readAsStringSync());
  }

  static String toCamelCase(String snakeCase) {
    return snakeCase.split('_').map((e) => toCapitalize(e)).join();
  }

  static String toCapitalize(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }
}
