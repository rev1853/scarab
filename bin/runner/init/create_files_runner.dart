import 'dart:async';

import '../../core/flow.dart';
import '../../file_creators/assets_svg_home_svg.dart';
import '../../file_creators/dot_env.dart';
import '../../file_creators/lib_app_resources_views_main.dart' as views_main;
import '../../file_creators/lib_app_resources_views_menu1.dart';
import '../../file_creators/lib_app_resources_views_menu2.dart';
import '../../file_creators/lib_app_resources_views_welcome.dart';
import '../../file_creators/lib_app_resources_widgets_bottom_navigation.dart';
import '../../file_creators/lib_app_states_controllers_bottom_navigation_state_controller.dart';
import '../../file_creators/lib_app_states_controllers_menu1_state_controller.dart';
import '../../file_creators/lib_app_states_controllers_menu2_state_controller.dart';
import '../../file_creators/lib_app_states_controllers_welcome_state_controller.dart';
import '../../file_creators/lib_constants_app.dart';
import '../../file_creators/lib_constants_regular_color.dart';
import '../../file_creators/lib_constants_regular_size.dart';
import '../../file_creators/lib_constants_views.dart';
import '../../file_creators/lib_core_env.dart';
import '../../file_creators/lib_core_model.dart';
import '../../file_creators/lib_core_page_route.dart';
import '../../file_creators/lib_core_regular_view.dart';
import '../../file_creators/lib_core_service.dart';
import '../../file_creators/lib_core_view_navigator.dart';
import '../../file_creators/lib_helpers_system_function_helper.dart';
import '../../file_creators/lib_main.dart';
import '../../file_creators/lib_routing_navigators_menu1_navigator.dart';
import '../../file_creators/lib_routing_navigators_menu2_navigator.dart';
import '../../file_creators/lib_routing_routes_routes.dart';
import '../../file_creators/pubspect_yaml.dart';
import '../../file_creators/scarab_json.dart';
import '../../helper/shell_commands.dart';

class CreateFilesRunner extends Flow {
  String projectName;
  final ShellCommands _shellCommand;

  CreateFilesRunner(this._shellCommand, {required this.projectName}) : super(level: 1);

  @override
  List<Map<String, dynamic>> get flow => [
        {
          'message': 'Update pubspec.yaml',
          'action': pubspecYaml,
        },
        {
          'message': 'Create scarab.json',
          'action': scarabJson,
        },
        {
          'message': 'Create .env',
          'action': dotEnv,
        },
        {
          'message': 'Create main.dart',
          'action': mainDart,
        },
        {
          'message': 'Create views/main.dart',
          'action': viewsMain,
        },
        {
          'message': 'Create views/menu1.dart',
          'action': viewsMenu1,
        },
        {
          'message': 'Create views/menu2.dart',
          'action': viewsMenu2,
        },
        {
          'message': 'Create views/welcome.dart',
          'action': viewsWelcome,
        },
        {
          'message': 'Create widget/bottom_navigation.dart',
          'action': widgetBottomNavigation,
        },
        {
          'message': 'Create controllers/bottom_navigation_state_controller.dart',
          'action': controllersBottomNavigationStateController,
        },
        {
          'message': 'Create controllers/menu1_state_Controller',
          'action': controllersMenu1StateController,
        },
        {
          'message': 'Create controllers/menu2_state_Controller',
          'action': controllersMenu2StateController,
        },
        {
          'message': 'Create controllers/welcome_state_Controller',
          'action': controllersWelcomeStateController,
        },
        {
          'message': 'Create constants/app.dart',
          'action': constantApp,
        },
        {
          'message': 'Create constant/regular_color.dart',
          'action': constantRegularColor,
        },
        {
          'message': 'Create constant/regular_size.dart',
          'action': constantRegularSize,
        },
        {
          'message': 'Create constant/views.dart',
          'action': constantViews,
        },
        {
          'message': 'Create core/env.dart',
          'action': coreEnv,
        },
        {
          'message': 'Create core/model.dart',
          'action': coreModel,
        },
        {
          'message': 'Create core/page_route.dart',
          'action': corePageRoute,
        },
        {
          'message': 'Create core/regular_view.dart',
          'action': coreRegularView,
        },
        {
          'message': 'Create core/service.dart',
          'action': coreService,
        },
        {
          'message': 'Create core/view_navigator.dart',
          'action': coreViewNavigator,
        },
        {
          'message': 'Create helper/system/function_helper.dart',
          'action': helpeRfunctionHelper,
        },
        {
          'message': 'Create navigation/menu1_navigator.dart',
          'action': navigatorsMenu1Navigator,
        },
        {
          'message': 'Create navigation/menu2_navigator.dart',
          'action': navigatorsMenu2Navigator,
        },
        {
          'message': 'Create routes/routes.dart',
          'action': routes,
        },
        {
          'message': 'Create assets/home.svg',
          'action': assetsHomeSvg,
        },
      ];

  Future pubspecYaml() async => await PubspecYaml(_shellCommand).create();
  Future scarabJson() async => await ScarabJson(_shellCommand).create();
  Future dotEnv() async => await DotEnv(_shellCommand).create();
  Future mainDart() async => await Main(_shellCommand).create();
  Future viewsMain() async => await views_main.Main(_shellCommand).create();
  Future viewsMenu1() async => await Menu1(_shellCommand).create();
  Future viewsMenu2() async => await Menu2(_shellCommand).create();
  Future viewsWelcome() async => await Welcome(_shellCommand).create();
  Future widgetBottomNavigation() async => await BottomNavigation(_shellCommand).create();
  Future controllersBottomNavigationStateController() async => await BottomNavigationStateController(_shellCommand).create();
  Future controllersMenu1StateController() async => await Menu1StateController(_shellCommand).create();
  Future controllersMenu2StateController() async => await Menu2StateController(_shellCommand).create();
  Future controllersWelcomeStateController() async => await WelcomeStateController(_shellCommand).create();
  Future constantApp() async => await App(_shellCommand).create();
  Future constantRegularColor() async => await RegularColor(_shellCommand).create();
  Future constantRegularSize() async => await RegularSize(_shellCommand).create();
  Future constantViews() async => await Views(_shellCommand).create();
  Future coreEnv() async => await Env(_shellCommand).create();
  Future coreModel() async => await Model(_shellCommand).create();
  Future corePageRoute() async => await PageRoute(_shellCommand).create();
  Future coreRegularView() async => await RegularView(_shellCommand).create();
  Future coreService() async => await Service(_shellCommand).create();
  Future coreViewNavigator() async => await ViewNavigator(_shellCommand).create();
  Future helpeRfunctionHelper() async => await FunctionHelper(_shellCommand).create();
  Future navigatorsMenu1Navigator() async => await Menu1Navigator(_shellCommand).create();
  Future navigatorsMenu2Navigator() async => await Menu2Navigator(_shellCommand).create();
  Future routes() async => await Routes(_shellCommand).create();
  Future assetsHomeSvg() async => await HomeSvg(_shellCommand).create();
}
