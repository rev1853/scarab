import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class FormSource extends MakeFileCreator {
  FormSource(
    ShellCommands shell,
    String newFilename,
    this.validatorName,
    this.validatorFileName,
  ) : super(shell, newFilename);

  String validatorName, validatorFileName;

  @override
  String get filename => "lib\\app\\states\\form_sources\\example_form_source.dart";

  @override
  String get suffix => 'form_source';

  @override
  Map<String, dynamic> get additionReplacer => {
        'validatorName': validatorName,
        'validatorFileName': validatorFileName,
      };
}
