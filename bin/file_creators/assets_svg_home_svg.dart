import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class HomeSvg extends FileCreator {
  HomeSvg(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "assets/svg/home.svg";

  @override
  Map<String, dynamic>? get replacer => {};
}
