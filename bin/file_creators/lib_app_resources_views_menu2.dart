import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Menu2 extends FileCreator {
  Menu2(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\resources\\views\\menu2.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
