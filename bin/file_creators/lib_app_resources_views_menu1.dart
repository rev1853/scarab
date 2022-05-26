import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Menu1 extends FileCreator {
  Menu1(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\resources\\views\\menu1.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
