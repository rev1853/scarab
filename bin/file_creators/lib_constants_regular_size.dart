import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class RegularSize extends FileCreator {
  RegularSize(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/constants/regular_size.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
