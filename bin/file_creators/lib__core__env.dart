import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Env extends FileCreator {
  Env(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\core\\env.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
