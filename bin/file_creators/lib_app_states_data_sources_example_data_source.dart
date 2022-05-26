import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class DataSource extends MakeFileCreator {
  DataSource(
    ShellCommands shell,
    String newFileName, {
    this.presenterDeclaration = '',
    this.presenterImport = '',
  }) : super(shell, newFileName);

  String presenterDeclaration, presenterImport;

  @override
  String get filename => "lib/app/states/data_sources/example_data_source.dart";

  @override
  String get suffix => 'data_source';

  @override
  Map<String, dynamic> get additionReplacer => {
        'presenterDeclaration': presenterDeclaration,
        'presenterImport': presenterImport,
      };
}
