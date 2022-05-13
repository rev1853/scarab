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
  Map<String, dynamic>? get replacer => {
        'projectName': projectName,
      };
}
