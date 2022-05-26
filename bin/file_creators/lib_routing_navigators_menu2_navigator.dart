import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Menu2Navigator extends FileCreator {
  Menu2Navigator(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/routing/navigators/menu2_navigator.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
