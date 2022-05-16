import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_data_sources_example_data_source.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';
import 'make_presenter_runner.dart';

class MakeDataSourceRunner extends MakeFlow {
  static final String flags = 'd';
  final String _fileName;
  final _shellCommand = ShellCommands();

  bool makePresenter = false;

  MakeDataSourceRunner(
    this._fileName, [
    int level = 0,
    this.makePresenter = false,
  ]) : super(level: level);

  String get projectName => _shellCommand.path.split('\\').last;

  String get presenterName => FileHelper.toCamelCase(_fileName) + "Presenter";

  String get presenterImport => "import 'package:$projectName/app/network/presenters/${_fileName}_presenter.dart';";

  String get presenterDeclaration => "$presenterName _presenter = $presenterName();";

  @override
  List<Map<String, dynamic>> get preFlow {
    List<Map<String, dynamic>> flows = [];

    if (makePresenter) {
      flows.add({
        'message': 'Creating presenter',
        'action': MakePresenterRunner(
          _fileName,
          level + 1,
        ),
      });
    }

    return flows;
  }

  @override
  String get fileName => "${_fileName}_data_source.dart";

  @override
  String get libPath => "app\\states\\data_sources";

  @override
  MakeFileCreator makeFileCreator(String filename) => DataSource(
        _shellCommand,
        filename,
        presenterDeclaration: makePresenter ? presenterDeclaration : '',
        presenterImport: makePresenter ? presenterImport : '',
      );
}
