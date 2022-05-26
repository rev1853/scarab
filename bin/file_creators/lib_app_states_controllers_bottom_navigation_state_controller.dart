import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class BottomNavigationStateController extends FileCreator {
  BottomNavigationStateController(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/app/states/controllers/bottom_navigation_state_controller.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
