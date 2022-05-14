import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class RegularString extends FileCreator {
  RegularString(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\constants\\strings\\regular_string.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
