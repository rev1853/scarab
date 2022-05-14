import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

main() async {
  Uri url = Uri.parse('https://api.github.com/repos/rev1853/scarab/contents/raw/lib/routing/routes/routes.dart.scarab');
  Map<String, String> headers = {
    'Authorization': 'token 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',
  };
  String response = (await http.get(url, headers: headers)).body;

  String responseDecoded = jsonDecode(response)['content'];

  var a = responseDecoded.split(RegExp(r'\n'));
  var file2 = await File(Directory.current.absolute.path + '\\tes2.txt').create();
  var c = a.map((item) => base64.decode(item)).toList();
  for (var item in c) {
    String content = file2.readAsStringSync();
    file2.writeAsBytesSync(item);
    String content2 = file2.readAsStringSync();
    file2.writeAsStringSync(content + content2);
  }
}
