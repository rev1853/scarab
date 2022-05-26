import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class App extends FileCreator {
  App(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/constants/app.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
