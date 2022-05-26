import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class Presenter extends MakeFileCreator {
  Presenter(ShellCommands shell, String newFilename) : super(shell, newFilename);

  @override
  String get filename => "lib/app/network/presenters/example_presenter.dart";

  @override
  String get suffix => 'presenter';
}
