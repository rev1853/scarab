import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_models_model.dart';
import '../../helper/shell_commands.dart';

class MakeModelRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeModelRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_model.dart";

  @override
  String get libPath => "app\\models";

  @override
  MakeFileCreator makeFileCreator(String filename) => AppModel(_shellCommand, filename);
}
