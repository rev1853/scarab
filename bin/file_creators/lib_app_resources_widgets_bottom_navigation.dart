import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class BottomNavigation extends FileCreator {
  BottomNavigation(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\resources\\widgets\\bottom_navigation.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
