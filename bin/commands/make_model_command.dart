// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';

class MakeModelCommand extends BaseCommand {
  MakeModelCommand()
      : super(
          command: 'model',
          description: 'Make a scarab model',
          example: "scarab make model my_model",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    try {
      print(await FileHelper.scarabJson);
    } catch (err) {
      commandError(err);
    }
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return true;
  }

  void commandError(err) {
    print(err);
    ShellCommands.echo("Model name must be specified");
  }
}
