import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_data_sources_example_data_source.dart';
import '../../helper/shell_commands.dart';

class MakeDataSourceRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeDataSourceRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_data_source.dart";

  @override
  String get libPath => "app\\states\\data_sources";

  @override
  MakeFileCreator makeFileCreator(String filename) => DataSource(_shellCommand, filename);
}
