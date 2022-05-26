// ignore_for_file: invalid_return_type_for_catch_error
import '../core/base_command.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';
import '../runner/make/make_data_source_runner.dart';

class MakeDataSourceCommand extends BaseCommand {
  MakeDataSourceCommand()
      : super(
          command: 'datasource',
          description: 'Make a scarab datasource',
          example: "scarab make datasource <datasource_name>",
        );

  @override
  void action(List<String> args, Map<String, dynamic> flags) async {
    MakeDataSourceRunner(args.first).run();
  }

  @override
  bool validator(List<String> args, Map<String, dynamic> flags) {
    return FileHelper.scarabJson != null && args.isNotEmpty;
  }

  @override
  String get validationMessage => "Data Source name must be specified";
}
