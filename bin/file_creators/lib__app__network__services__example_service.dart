import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleService extends FileCreator {
  ExampleService(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\network\\services\\example_service.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
