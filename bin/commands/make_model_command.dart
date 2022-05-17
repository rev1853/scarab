// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_model_runner.dart';

class MakeModelCommand extends BaseCommand {
  MakeModelCommand()
      : super(
          command: 'model',
          description: 'Make a scarab model',
          example: "scarab make model <model_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    MakeModelRunner(args.first).run();
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return FileHelper.scarabJson != null && args.isNotEmpty;
  }

  @override
  String get validationMessage => "Model name must be specified";
}
