import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Menu1StateController extends FileCreator {
  Menu1StateController(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/app/states/controllers/menu1_state_controller.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
