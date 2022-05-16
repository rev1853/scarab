import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_controllers_example_state_controller.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';

class MakeStateControllerRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeStateControllerRunner(this._fileName) : super(level: 1);

  @override
  String get fileName => "${_fileName}_state_controller.dart";

  @override
  String get libPath => "app\\states\\controllers";

  String get propertiesName => FileHelper.toCamelCase(_fileName) + "Properties";

  @override
  MakeFileCreator makeFileCreator(String filename) => StateController(_shellCommand, filename, propertiesName);
}
