import '../core/file_creator.dart';
import '../helper/file_helper.dart';
import '../helper/shell_commands.dart';

abstract class MakeFileCreator extends FileCreator {
  final String _newFilename;

  MakeFileCreator(
    ShellCommands shell,
    this._newFilename,
  ) : super(shell);

  @override
  String get filename;

  String get suffix;

  Map<String, dynamic> get additionReplacer => {};

  @override
  String get newFilename => _newFilename;

  String get className => FileHelper.toCamelCase(newFilename.split('\\').last.replaceAll('_$suffix.dart', '')) + FileHelper.toCamelCase(suffix);

  @override
  Map<String, dynamic>? get replacer => {
        'className': className,
      }..addAll(additionReplacer);
}
