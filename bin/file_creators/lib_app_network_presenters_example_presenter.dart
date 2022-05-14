import '../core/file_creator.dart';
import '../helper/shell_commands.dart';

class ExamplePresenter extends FileCreator {
  ExamplePresenter(
    ShellCommands shell,
  ) : super(shell);

  @override
  String get filename => "lib\\app\\network\\presenters\\example_presenter.dart";

  @override
  Map<String, dynamic>? get replacer => {};
}
