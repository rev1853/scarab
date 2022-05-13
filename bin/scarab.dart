import 'package:bosun/bosun.dart';

import 'commands/create.dart';

void main(List<String> args) {
  execute(
      BosunCommand(
        'scarab',
        description: "A command to create scarab project",
        subcommands: [CreateCommand()],
      ),
      args);
}
