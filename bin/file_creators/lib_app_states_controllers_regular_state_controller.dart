import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class RegularStateController extends FileCreator {
  RegularStateController(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/app/states/controllers/regular_state_controller.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
