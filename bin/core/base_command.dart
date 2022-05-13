// ignore_for_file: invalid_return_type_for_catch_error
import 'package:bosun/bosun.dart';

abstract class BaseCommand extends Command {
  BaseCommand({
    required String command,
    String? use,
    List<String>? aliases,
    String? description,
    String? example,
    List<Command>? subcommands,
    Map<String, String>? supportedFlags,
  }) : super(
          command: command,
          use: use,
          aliases: aliases,
          description: description,
          example: example,
          subcommands: subcommands,
          supportedFlags: supportedFlags,
        );

  String validationMessage = "An error was encountered";

  @override
  void run(List<String> args, Map<String, dynamic> flags) {
    if (validator(args, flags)) {
      action(args, flags);
    } else {
      print(validationMessage);
    }
  }

  bool validator(List<String> args, Map<String, dynamic> flags);

  void action(List<String> args, Map<String, dynamic> flags);
}
