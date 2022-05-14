// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/shell_commands.dart';
import '../runner/init/init_runner.dart';

class InitCommand extends BaseCommand {
  InitCommand()
      : super(
          command: 'init',
          description: 'initialize a scarab project',
          example: "scarab init <project-name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    String projectName = args.first;
    try {
      print(intro);
      ScarabInitRunner(projectName: projectName).run();
    } catch (err) {
      createProjectError(err);
    }
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    bool result = false;
    result = args.isNotEmpty;
    return result;
  }

  void createProjectSuccess(filename) {
    ShellCommands.echo("$filename was created");
  }

  void createProjectError(err) {
    ShellCommands.echo("An error was encountered: $err");
  }
}

String intro = '''
\x1B[92m
||=======================================================================================||
||                                                                                       ||
||                                  WELCOME TO SCARAB                                    ||
||                             YOUR PROJECT WILL BE CREATED                              ||
||                                  PLEASE BE PATIENT                                    ||
||                                                                                       ||
||=======================================================================================||
\x1B[92m
''';
