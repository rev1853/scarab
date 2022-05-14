import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExampleNavigator extends FileCreator {
  ExampleNavigator(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\routing\\navigators\\example_navigator.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
