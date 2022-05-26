import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleContract extends FileCreator {
  ExampleContract(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\network\\contracts\\example_contract.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
