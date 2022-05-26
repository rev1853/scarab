import 'dart:async';

import 'flow.dart';
import 'make_file_creator.dart';

abstract class MakeFlow extends Flow {
  MakeFlow({int level = 0}) : super(level: level);

  String get libPath;
  String get fileName;
  MakeFileCreator makeFileCreator(String filename);

  String get generatedFileName => "lib/$libPath/$fileName";

  List<Map<String, dynamic>> get preFlow => [];
  List<Map<String, dynamic>> get postFlow => [];

  @override
  List<Map<String, dynamic>> get flow => [
        ...preFlow,
        {
          'message': 'Create file $generatedFileName',
          'action': createFile,
        },
        ...postFlow,
      ];

  Future createFile() async => await makeFileCreator(generatedFileName).create();
}
