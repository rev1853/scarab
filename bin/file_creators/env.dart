import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Env extends FileCreator {
  Env(
    ShellCommands shell,
  ) : super(shell);

  String get projectName => shell.path.split('\\').last;

  @override
  String get filename => ".env";

  @override
  String get content {
    return readFile('/raw/.env.scarab', replacer: {'projectName': projectName});
  }
}
