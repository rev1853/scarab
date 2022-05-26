// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_presenter_runner.dart';

class MakePresenterCommand extends BaseCommand {
  MakePresenterCommand()
      : super(
          command: 'presenter',
          description: 'Make a scarab presenter',
          example: "scarab make presenter <presenter_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    MakePresenterRunner(args.first).run();
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return FileHelper.scarabJson != null && args.isNotEmpty;
  }

  @override
  String get validationMessage => "Presenter name must be specified";
}
