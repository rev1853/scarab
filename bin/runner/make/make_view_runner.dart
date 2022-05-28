import 'dart:io';

import '../../core/make_file_creator.dart';
import '../../core/make_flow.dart';
import '../../file_creators/lib_app_resources_views_example.dart';
import '../../helper/file_helper.dart';
import '../../helper/shell_commands.dart';
import 'make_presenter_runner.dart';
import 'make_state_controller_runner.dart';

class MakeViewRunner extends MakeFlow {
  final String _fileName;
  final _shellCommand = ShellCommands();

  bool makeListener = false;
  bool makeDataSource = false;
  bool makeFormSource = false;
  bool makePresenter = false;

  String? navigator;

  MakeViewRunner(
    this._fileName, {
    this.makeListener = false,
    this.makeDataSource = false,
    this.makeFormSource = false,
    this.makePresenter = false,
    this.navigator,
  });

  @override
  String get fileName => "${_fileName}_view.dart";

  @override
  String get libPath => "app/resources/views";

  String get routeName => _fileName.replaceAll('_', '-');
  String get stateControllerName => FileHelper.toCamelCase(_fileName) + "StateController";
  String get stateControllerFileName => "${_fileName}_state_controller.dart";

  @override
  List<Map<String, dynamic>> get preFlow {
    List<Map<String, dynamic>> flows = [
      {
        'message': 'Creating state controller',
        'action': MakeStateControllerRunner(
          _fileName,
          makeListener: makeListener,
          makeDataSource: makeDataSource,
          makeFormSource: makeFormSource,
          makePresenter: makePresenter,
        ),
      },
    ];

    if (navigator != null) {
      flows.add({
        'message': 'Add route to navigator',
        'action': addViewToNavigator,
      });
    } else {
      flows.add({
        'message': 'Add route to route',
        'action': addViewToRoute,
      });
    }

    return flows;
  }

  Future addViewToNavigator() async {
    String projectName = FileHelper.scarabJson!['name'];
    String routeItem = '''
        <<viewName>>View.route: (args) => ViewRoute(
              page: () => <<viewName>>View(),
              bindings: [
                BindingsBuilder(() {
                  Get.put(<<viewName>>StateController());
                })
              ],
            ),
      // please don't remove this line
    ''';
    String importLine = '''
      import 'package:$projectName/app/resources/views/$fileName';
      import 'package:$projectName/app/states/controllers/$stateControllerFileName';
      // import: please dont remove this line
    ''';
    String viewName = FileHelper.toCamelCase(_fileName);
    routeItem = FileHelper.replaceContent(routeItem, {
      "viewName": viewName,
    });

    File navigatorFile = File(Directory.current.absolute.path + "/lib/routing/navigators/${navigator}_navigator.dart");
    String navigatorContent = await navigatorFile.readAsString();
    navigatorContent = navigatorContent.replaceAll(
      "// please don't remove this line",
      routeItem,
    );
    navigatorContent = navigatorContent.replaceAll(
      "// import: please dont remove this line",
      importLine,
    );

    await navigatorFile.writeAsString(navigatorContent);
  }

  Future addViewToRoute() async {
    String projectName = FileHelper.scarabJson!['name'];
    String routeItem = '''
        Page(
          name: <<viewName>>View.route,
          page: () => <<viewName>>View(),
          bindings: [
            BindingsBuilder(
              () => {
                Get.lazyPut(() => <<viewName>>StateController()),
              },
            )
          ],
        ),
      // please don't remove this line
    ''';
    String importLine = '''
      import 'package:$projectName/app/resources/views/$fileName';
      import 'package:$projectName/app/states/controllers/$stateControllerFileName';
      // import: please dont remove this line
    ''';
    String viewName = FileHelper.toCamelCase(_fileName);
    routeItem = FileHelper.replaceContent(routeItem, {
      "viewName": viewName,
    });

    File navigatorFile = File(Directory.current.absolute.path + "/lib/routing/routes/routes.dart");
    String navigatorContent = await navigatorFile.readAsString();
    navigatorContent = navigatorContent.replaceAll(
      "// please don't remove this line",
      routeItem,
    );
    navigatorContent = navigatorContent.replaceAll(
      "// import: please dont remove this line",
      importLine,
    );

    await navigatorFile.writeAsString(navigatorContent);
  }

  @override
  MakeFileCreator makeFileCreator(String filename) => AppView(
        _shellCommand,
        filename,
        stateControllerName,
        stateControllerFileName,
        routeName,
      );
}
