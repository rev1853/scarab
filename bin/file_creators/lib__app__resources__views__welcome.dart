import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Welcome extends FileCreator {
  Welcome(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\resources\\views\\welcome.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
