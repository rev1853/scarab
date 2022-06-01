// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../runner/make/make_data_source_runner.dart';
import '../runner/make/make_form_source_runner.dart';
import '../runner/make/make_listener_runner.dart';
import '../runner/make/make_presenter_runner.dart';
import '../runner/make/make_view_runner.dart';

class MakeViewCommand extends BaseCommand {
  MakeViewCommand()
      : super(
          command: 'view',
          description: 'Make a scarab view',
          example: "scarab make view <view_name>",
          supportedFlags: {
            '-${MakeListenerRunner.flags}': 'Create listener for this file',
            '-${MakeDataSourceRunner.flags}': 'Create data source for this file',
            '-${MakeFormSourceRunner.flags}': 'Create form source for this file',
            '-${MakePresenterRunner.flags}': 'Create presenter for this file',
            '--navigator': 'Add this view to the navigator, default to route, make sure navigator was created. --navigator <file_name> e.g. --navigator user',
          },
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    MakeViewRunner(
      args.first,
      makeListener: flags.containsKey(MakeListenerRunner.flags),
      makeDataSource: flags.containsKey(MakeDataSourceRunner.flags),
      makeFormSource: flags.containsKey(MakeFormSourceRunner.flags),
      makePresenter: flags.containsKey(MakePresenterRunner.flags) && flags.containsKey(MakeDataSourceRunner.flags),
      navigator: flags.containsKey('navigator') ? args[1] : null,
    ).run();
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return FileHelper.scarabJson != null && (flags.containsKey('navigator') ? args.length == 2 : args.isNotEmpty);
  }

  @override
  String get validationMessage => "View name must be specified";
}
