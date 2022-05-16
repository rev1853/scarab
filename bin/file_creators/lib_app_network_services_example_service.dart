import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class AppService extends MakeFileCreator {
  AppService(ShellCommands shell, String newFilename) : super(shell, newFilename);

  @override
  String get filename => "lib\\app\\network\\services\\example_service.dart";

  @override
  String get suffix => 'service';

  @override
  Map<String, dynamic> get additionReplacer => {
        'urlPath': className.replaceAll('Service', '').toLowerCase(),
      };
}
