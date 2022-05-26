import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class PageRoute extends FileCreator {
  PageRoute(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib/core/page_route.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
