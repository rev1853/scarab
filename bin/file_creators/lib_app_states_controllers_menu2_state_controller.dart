import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Menu2StateController extends FileCreator {
  Menu2StateController(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\controllers\\menu2_state_controller.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
