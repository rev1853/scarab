import '../core/make_file_creator.dart';
import '../helper/shell_commands.dart';

class StateController extends MakeFileCreator {
  StateController(
    ShellCommands shell,
    String newFilename,
    this.propertiesName, {
    this.listenerImport = '',
    this.dataSourceImport = '',
    this.formSourceImport = '',
    this.listenerDeclaration = '',
    this.dataSourceDeclaration = '',
    this.formSourceDeclaration = '',
    this.listenerDelete = '',
    this.dataSourceDelete = '',
    this.formSourceDelete = '',
  }) : super(shell, newFilename);
  String propertiesName;

  String listenerImport, dataSourceImport, formSourceImport;
  String listenerDeclaration, dataSourceDeclaration, formSourceDeclaration;
  String listenerDelete, dataSourceDelete, formSourceDelete;

  @override
  String get filename => "lib\\app\\states\\controllers\\example_state_controller.dart";

  @override
  String get suffix => 'state_controller';

  @override
  Map<String, dynamic> get additionReplacer => {
        'propertiesName': propertiesName,
        'listenerImport': listenerImport,
        'dataSourceImport': dataSourceImport,
        'formSourceImport': formSourceImport,
        'listenerDeclaration': listenerDeclaration,
        'dataSourceDeclaration': dataSourceDeclaration,
        'formSourceDeclaration': formSourceDeclaration,
        'listenerDelete': listenerDelete,
        'dataSourceDelete': dataSourceDelete,
        'formSourceDelete': formSourceDelete,
      };
}
