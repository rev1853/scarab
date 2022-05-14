import '../../core/flow.dart';
import '../../helper/shell_commands.dart';

class CreateDirectoryRunner extends Flow {
  String projectName;
  final ShellCommands _shellCommand;

  CreateDirectoryRunner(this._shellCommand, {required this.projectName}) : super(level: 1);

  @override
  List<Map<String, dynamic>> get flow => List.generate(importantDirectories.length, (index) {
        String directoryName = importantDirectories[index];
        Future Function() action = createDirectory(directoryName);
        return {
          'message': 'Create $directoryName',
          'action': action,
        };
      });

  Future Function() createDirectory(String directoryName) => () async => await _shellCommand.createDirectory(directoryName);

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
        'lib\\routing',
        'lib\\routing\\middlewares',
        'lib\\routing\\navigators',
        'lib\\routing\\routes',
        'lib\\constants',
        'lib\\helpers',
        'lib\\helpers\\system',
      ];
}
