// ignore_for_file: invalid_return_type_for_catch_error

import '../core/base_command.dart';
import 'make_data_source_command.dart';
import 'make_form_source_command.dart';
import 'make_listener_command.dart';
import 'make_model_command.dart';
import 'make_navigator_command.dart';
import 'make_presenter_command.dart';
import 'make_service_command.dart';
import 'make_view_command.dart';

class MakeCommand extends BaseCommand {
  MakeCommand()
      : super(
          command: 'make',
          description: 'Make a scarab file',
          example: "scarab make <file> <filename>",
          subcommands: [
            MakeModelCommand(),
            MakePresenterCommand(),
            MakeServiceCommand(),
            MakeNavigatorCommand(),
            MakeViewCommand(),
            MakeListenerCommand(),
            MakeDataSourceCommand(),
            MakeFormSourceCommand(),
          ],
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) {}

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return true;
  }
}
