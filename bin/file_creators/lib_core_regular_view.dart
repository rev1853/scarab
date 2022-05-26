import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class RegularView extends FileCreator {
  RegularView(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/core/regular_view.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
