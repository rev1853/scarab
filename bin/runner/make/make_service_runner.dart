import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_network_services_example_service.dart';
import '../../helper/shell_commands.dart';

class MakeServiceRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakeServiceRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_service.dart";

  @override
  String get libPath => "app\\network\\services";

  @override
  MakeFileCreator makeFileCreator(String filename) => AppService(_shellCommand, filename);
}
