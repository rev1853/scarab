import 'dart:async';
import 'dart:io';

import '../core/flow.dart';
import '../file_creators/env.dart';
import '../file_creators/scarab_json.dart';
import '../helper/shell_commands.dart';

class ScarabInit extends Flow {
  String projectName;
  final _shellCommand = ShellCommands();

  ScarabInit({required this.projectName});

  @override
  List<Map<String, dynamic>> get flow => [
        {
          'message': 'Create project on ./$projectName',
          'action': createProject,
        },
        {
          'message': 'Change directory to ./$projectName',
          'action': changeDirectory,
        },
        {
          'message': 'Install dependencies',
          'action': installDependencies,
        },
        {
          'message': 'Create scarab.json',
          'action': createScarabJson,
        },
        {
          'message': 'Create directories',
          'action': createDirectories,
        },
        {
          'message': 'Create .env file',
          'action': createEnv,
        },
      ];

  Future createProject() async => await _shellCommand.flutterCreate(projectName);
  Future createDirectories() async => await Future.forEach<String>(importantDirectories, (element) async => await _shellCommand.createDirectory(element));
  void changeDirectory() => _shellCommand.cd(projectName);
  Future installDependencies() async => await Future.forEach<String>(importantDependencies, (element) async => await _shellCommand.flutterPubGet(element));

  Future createScarabJson() async {
    return await ScarabJson(_shellCommand).create();
  }

  Future createEnv() async {
    return await Env(_shellCommand).create();
  }

  List<String> get importantDependencies => [
        'get',
        'intl',
        'flutter_dotenv',
      ];

  List<String> get importantDirectories => [
        'assets',
        'lib\\app\\models',
        'lib\\app\\network\\contracts',
        'lib\\app\\network\\services',
        'lib\\app\\network\\presenters',
        'lib\\app\\states\\controllers',
        'lib\\app\\states\\data_sources',
        'lib\\app\\states\\form_sources',
        'lib\\app\\states\\form_validators',
        'lib\\app\\states\\listeners',
        'lib\\app\\resources\\views',
        'lib\\app\\resources\\widgets',
        'lib\\core',
        'lib\\routing\\middlewares',
        'lib\\routing\\navigators',
        'lib\\routing\\routes',
        'lib\\cosntant',
        'lib\\helper',
      ];
}
