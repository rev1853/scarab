import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class RegularColor extends FileCreator {
  RegularColor(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\constants\\regular_color.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
