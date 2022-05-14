import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleFormSource extends FileCreator {
  ExampleFormSource(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\form_sources\\example_form_source.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
