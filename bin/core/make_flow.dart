import 'dart:async';

import 'flow.dart';
import 'make_file_creator.dart';

abstract class MakeFlow extends Flow {
  String get libPath;
  String get fileName;
  MakeFileCreator makeFileCreator(String filename);

  String get generatedFileName => "lib\\$libPath\\$fileName";

  @override
  List<Map<String, dynamic>> get flow => [
        {
          'message': 'Create file $generatedFileName.dart',
          'action': createFile,
        },
      ];

  Future createFile() async => await makeFileCreator(generatedFileName).create();
}
