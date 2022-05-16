import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class Navigator extends MakeFileCreator {
  Navigator(
    ShellCommands shell,
    String newFileName,
    this.enumName,
  ) : super(shell, newFileName);

  String enumName;

  @override
  String get filename => "lib\\routing\\navigators\\example_navigator.dart";

  @override
  String get suffix => 'navigator';

  @override
  Map<String, dynamic> get additionReplacer => {
        'viewsEnum': enumName,
      };
}
