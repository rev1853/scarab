import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Model extends FileCreator {
  Model(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/core/model.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
