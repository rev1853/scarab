import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleModelDart extends FileCreator {
  ExampleModelDart(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "/lib/app/models/example_model.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
