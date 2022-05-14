import '../../core/flow.dart';
import '../../helper/shell_commands.dart';

class InstallDependenciesRunner extends Flow {
  String projectName;
  final ShellCommands _shellCommand;

  InstallDependenciesRunner(this._shellCommand, {required this.projectName}) : super(level: 1);

  @override
  List<Map<String, dynamic>> get flow => List.generate(importantDependencies.length, (index) {
        String packageName = importantDependencies[index];
        Future Function() action = installDependency(packageName);
        return {
          'message': 'Install $packageName',
          'action': action,
        };
      });

  Future Function() installDependency(String packageName) => () async => await _shellCommand.flutterPubGet(packageName);

  List<String> get importantDependencies => [
        'get',
        'intl',
        'flutter_dotenv',
      ];
}
