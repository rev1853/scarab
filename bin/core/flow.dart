import 'dart:async';

abstract class Flow {
  ///
  /// The flow to be executed.
  ///the flow item must have a message, and action key
  ///
  List<Map<String, dynamic>> get flow => [];

  Future run() async {
    await Future.forEach<int>(flow.asMap().keys, runner);
  }

  Future runner(int key) async {
    try {
      if (flow[key]['action'] is FutureOr<void> Function()) {
        print(flow[key]['message']);
        if (flow[key]['action'] is Future Function()) {
          await flow[key]['action']?.call();
        } else {
          flow[key]['action']?.call();
        }
      }
    } catch (err) {
      rethrow;
    }
  }
}
