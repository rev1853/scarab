import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class AppView extends MakeFileCreator {
  AppView(
    ShellCommands shell,
    String newFilename,
    this.stateControllerName,
    this.stateControllerFileName,
    this.routeName,
  ) : super(shell, newFilename);

  String stateControllerName;
  String stateControllerFileName;
  String routeName;

  @override
  String get filename => "lib/app/resources/views/example.dart";

  @override
  String get suffix => 'view';

  @override
  Map<String, dynamic> get additionReplacer => {
        'stateControllerName': stateControllerName,
        'stateControllerFileName': stateControllerFileName,
        'routeName': routeName,
      };
}
