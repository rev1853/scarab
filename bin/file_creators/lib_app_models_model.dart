import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class AppModel extends MakeFileCreator {
  AppModel(
    ShellCommands shell,
    String newFileName,
  ) : super(shell, newFileName);

  @override
  String get filename => "lib\\app\\models\\example_model.dart";

  @override
  String get suffix => 'model';
}
