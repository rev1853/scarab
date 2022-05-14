import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleStateController extends FileCreator {
  ExampleStateController(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\controllers\\example_state_controller.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
