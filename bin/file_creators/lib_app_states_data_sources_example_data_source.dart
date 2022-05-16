import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class DataSource extends MakeFileCreator {
  DataSource(
    ShellCommands shell,
    String newFileName,
  ) : super(shell, newFileName);

  @override
  String get filename => "lib\\app\\states\\data_sources\\example_data_source.dart";

  @override
  String get suffix => 'data_source';
}
