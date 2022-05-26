import 'package:bosun/bosun.dart';

import 'commands/init_command.dart';
import 'commands/make_command.dart';

void main(List<String> args) {
  try {
    execute(
        BosunCommand(
          'scarab',
          description: "A command to create scarab project",
          subcommands: [InitCommand(), MakeCommand()],
        ),
        args);
  } catch (err) {
    print(err.toString());
  }
}
