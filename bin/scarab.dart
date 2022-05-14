import 'package:bosun/bosun.dart';

import 'commands/init_command.dart';

void main(List<String> args) {
  execute(
      BosunCommand(
        'scarab',
        description: "A command to create scarab project",
        subcommands: [InitCommand()],
      ),
      args);
}
