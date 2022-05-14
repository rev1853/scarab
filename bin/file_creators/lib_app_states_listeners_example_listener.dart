import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleListener extends FileCreator {
  ExampleListener(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\states\\listeners\\example_listener.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
