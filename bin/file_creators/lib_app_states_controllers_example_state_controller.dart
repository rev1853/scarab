import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class StateController extends MakeFileCreator {
  StateController(ShellCommands shell, String newFilename, this.propertiesName) : super(shell, newFilename);
  String propertiesName;

  @override
  String get filename => "lib\\app\\states\\controllers\\example_state_controller.dart";

  @override
  String get suffix => 'state_controller';

  @override
  Map<String, dynamic> get additionReplacer => {
        'propertiesName': propertiesName,
      };
}
