import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_form_sources_example_form_source.dart';
import '../../file_creators/lib_app_states_form_validators_example_validator.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';
import 'make_validator_runner.dart';

class MakeFormSourceRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeFormSourceRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_form_source.dart";

  @override
  String get libPath => "app\\states\\form_sources";

  String get validatorName => FileHelper.toCamelCase(_fileName) + "Validator";

  String get validatorFileName => "${_fileName}_validator.dart";

  @override
  List<Map<String, dynamic>> get preFlow => [
        {
          'message': "Creating validator",
          'action': MakeValidatorRunner(_fileName),
        }
      ];

  @override
  MakeFileCreator makeFileCreator(String filename) => FormSource(
        _shellCommand,
        filename,
        validatorName,
        validatorFileName,
      );
}
