import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constant.dart';

main() async {
  String? data = await fetchBase64Content('.env');
  print("data: $data");
}

Future<String?> fetchBase64Content(String filename) async {
  try {
    String filenameFormatted = filename.replaceAll('/', '/') + '.scarab';
    Uri url = Uri.parse(RAW_URL);
    Map<String, String> body = {
      'path': filenameFormatted,
    };
    String response = (await http.post(url, body: body)).body;
    print(response);
    return jsonDecode(response)['content'];
  } catch (err) {
    throw '''Cannot read file: $filename, Check your internet connection.''';
  }
}
