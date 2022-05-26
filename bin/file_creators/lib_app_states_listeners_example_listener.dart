import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class Listener extends MakeFileCreator {
  Listener(
    ShellCommands shell,
    String newFileName,
  ) : super(shell, newFileName);

  @override
  String get filename => "lib\\app\\states\\listeners\\example_listener.dart";

  @override
  String get suffix => 'listener';
}
