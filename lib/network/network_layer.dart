import 'package:appointment_scheduler_command_line_test/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;

class NetworkLayer {
  //MARK: - Public
  static Future<Either<Failure, String>> checkGlastonSite() {
    return _getRequest(url: 'https://glastonbury.seetickets.com');
  }

  //MARK: - Private
  static Future<Either<Failure, String>> _getRequest({required String url}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final parsedHtml = html_parser.parse(response.body);

        return Right(parsedHtml.body?.innerHtml ?? '');
      } else {
        return Left(
          Failure(
            '💥 💥 💥 Code ${response.statusCode} -\n${response.body} 💥 💥 💥',
          ),
        );
      }
    } catch (e) {
      return Left(
        Failure(
          e.toString(),
        ),
      );
    }
  }
}
