import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_listeners_example_listener.dart';
import '../../helper/shell_commands.dart';

class MakeListenerRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeListenerRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_listener.dart";

  @override
  String get libPath => "app\\states\\listeners";

  @override
  MakeFileCreator makeFileCreator(String filename) => Listener(_shellCommand, filename);
}
