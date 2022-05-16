import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_form_validators_example_validator.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';

class MakeValidatorRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeValidatorRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_validator.dart";

  @override
  String get libPath => "app\\states\\form_validators";

  String get formSourceName => FileHelper.toCamelCase(_fileName) + "FormSource";

  String get formSourceFileName => "${_fileName}_form_source.dart";

  @override
  MakeFileCreator makeFileCreator(String filename) => Validator(
        _shellCommand,
        filename,
        formSourceName,
        formSourceFileName,
      );
}
