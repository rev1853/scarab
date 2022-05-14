import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Main extends FileCreator {
  Main(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\resources\\views\\main.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
