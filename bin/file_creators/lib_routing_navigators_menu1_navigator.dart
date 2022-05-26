import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Menu1Navigator extends FileCreator {
  Menu1Navigator(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/routing/navigators/menu1_navigator.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
