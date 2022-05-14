import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleValidator extends FileCreator {
  ExampleValidator(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\form_validators\\example_validator.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
