import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class WelcomeStateController extends FileCreator {
  WelcomeStateController(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\controllers\\welcome_state_controller.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
