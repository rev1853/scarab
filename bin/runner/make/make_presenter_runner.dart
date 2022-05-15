import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_network_presenters_example_presenter.dart';
import '../../helper/shell_commands.dart';

class MakePresenterRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  MakePresenterRunner(this._fileName);

  @override
  String get fileName => "${_fileName}_presenter.dart";

  @override
  String get libPath => "app\\network\\presenters";

  @override
  MakeFileCreator makeFileCreator(String filename) => Presenter(_shellCommand, filename);
}
