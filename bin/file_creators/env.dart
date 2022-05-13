import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Env extends FileCreator {
  Env(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => ".env";

  @override
  Map<String, dynamic>? get replacer => {};
}
