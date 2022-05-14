import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Example extends FileCreator {
  Example(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\resources\\views\\example.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
