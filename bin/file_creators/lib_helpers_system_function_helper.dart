import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class FunctionHelper extends FileCreator {
  FunctionHelper(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/helpers/system/function_helper.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
