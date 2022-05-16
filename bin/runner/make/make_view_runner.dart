import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_resources_views_example.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';
import 'make_state_controller_runner.dart';

class MakeViewRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeViewRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_view.dart";

  @override
  String get libPath => "app\\resources\\views";

  String get routeName => _fileName.replaceAll('_', '-');
  String get stateControllerName => FileHelper.toCamelCase(_fileName) + "StateController";
  String get stateControllerFileName => "${_fileName}_state_controller.dart";

  @override
  List<Map<String, dynamic>> get preFlow => [
        {
          'message': 'Creating state controller',
          'action': MakeStateControllerRunner(_fileName),
        }
      ];

  @override
  MakeFileCreator makeFileCreator(String filename) => AppView(
        _shellCommand,
        filename,
        stateControllerName,
        stateControllerFileName,
        routeName,
      );
}
