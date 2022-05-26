import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Routes extends FileCreator {
  Routes(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/routing/routes/routes.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
