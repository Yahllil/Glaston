import 'dart:async';
import 'package:appointment_scheduler_command_line_test/handlers/glaston_handler.dart';

void main(List<String> arguments) {
  print('Starting program');
  final DateTime startedRunningDate = DateTime.now();

  Timer.periodic(
    Duration(seconds: 1),
    (timer) {
      final secondsSinceStartedRunning = DateTime.now().difference(startedRunningDate).inSeconds;

      GlastonHanlder.checkSite();
      print('Started running $secondsSinceStartedRunning sec ago');
    },
  );
}
