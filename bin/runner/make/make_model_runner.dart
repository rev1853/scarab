import 'dart:async';

import '../../constant.dart';
import '../../core/flow.dart';
import '../../file_creators/lib_app_models_model.dart';
import '../../helper/shell_commands.dart';

class MakeModelRunner extends Flow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeModelRunner(this._fileName);

  String get fileName => "$MODELS_FOLDER\\${_fileName}_model.dart";

  @override
  List<Map<String, dynamic>> get flow => [
        {
          'message': 'Create model $fileName.dart',
          'action': createModel,
        },
      ];

  Future createModel() async => await AppModel(_shellCommand, fileName).create();
}
