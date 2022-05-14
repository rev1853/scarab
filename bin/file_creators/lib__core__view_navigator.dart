import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ViewNavigator extends FileCreator {
  ViewNavigator(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\core\\view_navigator.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
