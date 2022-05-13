import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ScarabJson extends FileCreator {
  ScarabJson(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "scarab.json";

  @override
  Map<String, dynamic>? get replacer => {};
}
