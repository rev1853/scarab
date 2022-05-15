import '../core/file_creator.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';

class AppModel extends FileCreator {
  AppModel(
    ShellCommands shell,
    this._newFilename,
  ) : super(shell);

  final String _newFilename;

  @override
  String get filename => "lib\\app\\models\\example_model.dart";

  @override
  String get newFilename => _newFilename;

  String get className => FileHelper.toCamelCase(_newFilename.split('\\').last.replaceAll('_model.dart', ''));

  @override
  Map<String, dynamic>? get replacer => {
        'className': className,
      };
}
