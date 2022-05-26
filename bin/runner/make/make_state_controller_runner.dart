import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_states_controllers_example_state_controller.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';
import 'make_data_source_runner.dart';
import 'make_form_source_runner.dart';
import 'make_listener_runner.dart';

class MakeStateControllerRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  bool makeListener = false;
  bool makeDataSource = false;
  bool makeFormSource = false;
  bool makePresenter = false;

  MakeStateControllerRunner(
    this._fileName, {
    this.makeListener = false,
    this.makeDataSource = false,
    this.makeFormSource = false,
    this.makePresenter = false,
  }) : super(level: 1);

  @override
  String get fileName => "${_fileName}_state_controller.dart";

  @override
  String get libPath => "app\\states\\controllers";

  String get projectName => _shellCommand.path.split('\\').last;

  String get propertiesName => FileHelper.toCamelCase(_fileName) + "Properties";
  String get listenerName => FileHelper.toCamelCase(_fileName) + "Listener";
  String get dataSourceName => FileHelper.toCamelCase(_fileName) + "DataSource";
  String get formSourceName => FileHelper.toCamelCase(_fileName) + "FormSource";

  String get listenerImport => "import 'package:$projectName/app/states/listeners/${_fileName}_listener.dart';";
  String get dataSourceImport => "import 'package:$projectName/app/states/data_sources/${_fileName}_data_source.dart';";
  String get formSourceImport => "import 'package:$projectName/app/states/form_sources/${_fileName}_form_source.dart';";

  String get listenerDeclaration => "$listenerName listener = Get.put($listenerName());";
  String get dataSourceDeclaration => "$dataSourceName dataSource = Get.put($dataSourceName());";
  String get formSourceDeclaration => "$formSourceName formSource = Get.put($formSourceName());";

  String get listenerDelete => "Get.delete<$listenerName>();";
  String get dataSourceDelete => "Get.delete<$dataSourceName>();";
  String get formSourceDelete => "Get.delete<$formSourceName>();";

  @override
  List<Map<String, dynamic>> get preFlow {
    List<Map<String, dynamic>> flows = [];

    if (makeListener) {
      flows.add({
        'message': 'Creating listener',
        'action': MakeListenerRunner(_fileName, 2),
      });
    }

    if (makeDataSource) {
      flows.add({
        'message': 'Creating data source',
        'action': MakeDataSourceRunner(_fileName, 2, makePresenter),
      });
    }

    if (makeFormSource) {
      flows.add({
        'message': 'Creating form source',
        'action': MakeFormSourceRunner(_fileName, 2),
      });
    }

    return flows;
  }

  @override
  MakeFileCreator makeFileCreator(String filename) => StateController(
        _shellCommand,
        filename,
        propertiesName,
        listenerImport: makeListener ? listenerImport : '',
        dataSourceImport: makeDataSource ? dataSourceImport : '',
        formSourceImport: makeFormSource ? formSourceImport : '',
        listenerDeclaration: makeListener ? listenerDeclaration : '',
        dataSourceDeclaration: makeDataSource ? dataSourceDeclaration : '',
        formSourceDeclaration: makeFormSource ? formSourceDeclaration : '',
        listenerDelete: makeListener ? listenerDelete : '',
        dataSourceDelete: makeDataSource ? dataSourceDelete : '',
        formSourceDelete: makeFormSource ? formSourceDelete : '',
      );
}
