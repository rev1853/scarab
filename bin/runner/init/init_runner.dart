import 'dart:async';

import '../../core/flow.dart';
import '../../helper/shell_commands.dart';
import 'create_directory_runner.dart';
import 'create_files_runner.dart';
import 'install_dependencies_runner.dart';

class ScarabInitRunner extends Flow {
  String projectName;
  final _shellCommand = ShellCommands();

  ScarabInitRunner({required this.projectName});

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
          'action': InstallDependenciesRunner(_shellCommand, projectName: projectName),
        },
        {
          'message': 'Create directories',
          'action': CreateDirectoryRunner(_shellCommand, projectName: projectName),
        },
        {
          'message': 'Create scarab files',
          'action': CreateFilesRunner(_shellCommand, projectName: projectName),
        },
      ];

  Future createProject() async => await _shellCommand.flutterCreate(projectName);
  void changeDirectory() => _shellCommand.cd(projectName);
}
