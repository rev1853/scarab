import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class Validator extends MakeFileCreator {
  Validator(
    ShellCommands shell,
    String newFilename,
    this.formSourceName,
    this.formSourceFileName,
  ) : super(shell, newFilename);

  String formSourceName;
  String formSourceFileName;

  @override
  String get filename => "lib/app/states/form_validators/example_validator.dart";

  @override
  String get suffix => 'validator';

  @override
  Map<String, dynamic> get additionReplacer => {
        'formSourceName': formSourceName,
        'formSourceFileName': formSourceFileName,
      };
}
