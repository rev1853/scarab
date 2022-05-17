// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_listener_runner.dart';

class MakeListenerCommand extends BaseCommand {
  MakeListenerCommand()
      : super(
          command: 'listener',
          description: 'Make a scarab listener',
          example: "scarab make listener <listener_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    MakeListenerRunner(args.first).run();
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return FileHelper.scarabJson != null && args.isNotEmpty;
  }

  @override
  String get validationMessage => "Listener name must be specified";
}
