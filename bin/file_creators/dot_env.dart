import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class DotEnv extends FileCreator {
  DotEnv(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => ".env";

  @override
  Map<String, dynamic>? get replacer => {};
}
