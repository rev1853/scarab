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
    MakeFormSourceRunner(args.first).run();
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return FileHelper.scarabJson != null && args.isNotEmpty;
  }

  @override
  String get validationMessage => "Form Source name must be specified";
}
