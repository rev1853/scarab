// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_navigator_runner.dart';

class MakeNavigatorCommand extends BaseCommand {
  MakeNavigatorCommand()
      : super(
          command: 'navigator',
          description: 'Make a scarab navigator',
          example: "scarab make navigator <navigator_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    try {
      MakeNavigatorRunner(args.first).run();
    } catch (err) {
      commandError(err);
    }
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    if (FileHelper.scarabJson != null) {
      return true;
    }

    if (args.isNotEmpty) {
      return true;
    }
    return false;
  }

  void commandError(err) {
    ShellCommands.echo("Navigator name must be specified");
  }
}
