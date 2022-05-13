// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../runner/init.dart';

class CreateCommand extends BaseCommand {
  CreateCommand()
      : super(
          command: 'create',
          description: 'Create a scarab project',
          example: "scarab create <project-name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    String projectName = args.first;
    try {
      await ScarabInit(projectName: projectName).run();
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
    print("$filename was created");
  }

  void createProjectError(err) {
    print("An error was encountered: $err");
  }
}
