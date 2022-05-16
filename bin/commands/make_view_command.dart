// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_view_runner.dart';

class MakeViewCommand extends BaseCommand {
  MakeViewCommand()
      : super(
          command: 'view',
          description: 'Make a scarab view',
          example: "scarab make view <view_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    try {
      MakeViewRunner(args.first).run();
    } catch (err) {
      commandError(err);
    }
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    print(FileHelper.scarabJson);
    if (FileHelper.scarabJson != null) {
      return true;
    }

    if (args.isNotEmpty) {
      return true;
    }
    return false;
  }

  void commandError(err) {
    print(err);
    ShellCommands.echo("View name must be specified");
  }
}
