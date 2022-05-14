import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleDataSource extends FileCreator {
  ExampleDataSource(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\data_sources\\example_data_source.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
