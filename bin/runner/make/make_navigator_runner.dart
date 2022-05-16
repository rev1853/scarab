import 'dart:io';

import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_routing_navigators_example_navigator.dart';
import '../../helper/shell_commands.dart';

class MakeNavigatorRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeNavigatorRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_navigator.dart";

  @override
  String get libPath => "routing\\navigators";

  @override
  List<Map<String, dynamic>> get preFlow => [
        {
          'message': 'Add new enum to Views',
          'action': addEnum,
        }
      ];

  Future addEnum() async {
    File enumFile = File(Directory.current.absolute.path + '\\lib\\constants\\views.dart');

    String content = await enumFile.readAsString();
    content = content.replaceAll(' ', '').replaceAll('{', '').replaceAll('}', '').replaceAll('', '').replaceAll('\n', '');
    content = content.replaceAll('enum', '').replaceAll('Views', '');

    List<String> enums = content.split(',');
    enums.add(_fileName);

    String enumsString = enums.join(', ');
    content = 'enum Views { $enumsString }\n';

    await enumFile.writeAsString(content);
  }

  @override
  MakeFileCreator makeFileCreator(String filename) => Navigator(_shellCommand, filename, _fileName);
}
