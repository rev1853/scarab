import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class Model extends FileCreator {
  Model(
    ShellCommands shell,
    this._newFilename,
  ) : super(shell);

  final String _newFilename;

  @override
  String get filename => "lib\\app\\models\\example_model.dart";

  @override
  String get newFilename => _newFilename;

  @override
  Map<String, dynamic>? get replacer => {};
}
