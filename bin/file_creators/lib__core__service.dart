import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Service extends FileCreator {
  Service(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\core\\service.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
