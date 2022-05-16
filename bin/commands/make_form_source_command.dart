// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_form_source_runner.dart';

class MakeFormSourceCommand extends BaseCommand {
  MakeFormSourceCommand()
      : super(
          command: 'formsource',
          description: 'Make a scarab formsource',
          example: "scarab make formsource <formsource_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    try {
      MakeFormSourceRunner(args.first).run();
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
    ShellCommands.echo("Form Source name must be specified");
  }
}
