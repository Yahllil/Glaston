import 'package:appointment_scheduler_command_line_test/network/network_layer.dart';
import 'package:process_run/shell.dart';

class GlastonHanlder {
  static Future<void> checkSite() async {
    final innerHtmlOrFailure = await NetworkLayer.checkGlastonSite();

    innerHtmlOrFailure.fold(
      (failure) => print(failure),
      (innerHtml) {
        _handleInnerHtml(innerHtml);
      },
    );
  }

  //MARK: - Private
  static void _handleInnerHtml(String innerHtml) {
    final doesContainSoldOutText = innerHtml.contains('GLASTONBURY 2022 - SOLD OUT');

    if (doesContainSoldOutText) {
      print('Glastonbury tickets are sold out');
      print('');
    } else {
      print('🎫 🎫 🎫 Glastonbury tickets might not be sold out!!! 🎫 🎫 🎫');

      var shell = Shell();
      shell.run('afplay /System/Library/Sounds/Glass.aiff');
    }
  }
}
