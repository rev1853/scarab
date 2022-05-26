import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Views extends FileCreator {
  Views(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/constants/views.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
